from django.shortcuts import render,redirect,get_object_or_404
from django.db.models import Q,F
from django.core.cache import cache
from django.views import View
from django.views.generic import DetailView,ListView
from blog.models import Post,Tag,Category
from config.models import SideBar,VisitNumber,Link
from comment.models import Comment
from login.views import hash_md5
from login.models import User
from datetime import date
from config.visit_info import change_info
import markdown

import time
# Create your views here.



from django.shortcuts import HttpResponse,Http404

#跳转到主页
def index(request):
    return redirect('index')


class CommonView:
    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        url = self.request.path
        visit_num = VisitNumber.objects.get(id=1)
        usernm_md5 = self.request.session.get('username')
        if usernm_md5:
            user = User.latest_posts()
            for obj in user:
                if hash_md5(obj.username) == usernm_md5:
                    context.update({
                        "user": obj
                    })
        context.update({
            'Sidebar': SideBar.get_all(),
            'count':Post.count(),
            "links":Link.get_all(),
            'comment':Comment.count(),
            'category':Category.get_all(),
            'url':url,
            "visit_num":visit_num.count
        })
        return context


class IndexView(CommonView,ListView):
    queryset = Post.latest_posts().order_by('id')
    context_object_name = 'post'
    paginate_by = 5
    template_name = 'blog/list.html'


    def get(self,request,*args,**kwargs):
        change_info(request)
        response = super().get(request,*args,**kwargs)
        return response

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.session.get("is_login",None):
            login_sidebar = SideBar.objects.get(pk=5)
            login_sidebar.status = 0
            login_sidebar.save()

        return context

class PostView(CommonView,DetailView):
    queryset = Post.latest_posts()
    context_object_name = 'post'
    pk_url_kwarg = 'post_id'
    template_name = 'blog/post_detail.html'

    def get(self,request,*args,**kwargs):
        response = super().get(request, *args,**kwargs)
        self.hanle_visited()
        return response

    def hanle_visited(self):
        increase_pv = False
        increase_uv = False
        uid = self.request.uid
        pv_key = "pv:%s:%s"%(uid,self.request.path)
        uv_key = "uv:%s:%s:%s" % (uid, str(date.today()),self.request.path)
        if not cache.get(pv_key):
            increase_pv = True
            cache.set(pv_key,1,1*60)

        if not cache.get(uv_key):
            increase_uv = True
            cache.set(pv_key,1,24*60*60)

        if increase_pv and increase_uv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv')+1,uv=F('uv')+1)
        elif increase_pv:
            Post.objects.filter(pk=self.object.id).update(pv=F('pv') + 1)
        elif increase_pv:
            Post.objects.filter(pk=self.object.id).update(pv=F('uv') + 1)


    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        post_id = self.kwargs.get('post_id')
        queryset_created = str(Post.objects.get(pk = post_id).created_time).split(" ")[0]
        queryset_updated = str(Post.objects.get(pk = post_id).updated_time).split(" ")[0]
        uv = Post.objects.get(pk=post_id).uv
        if self.request.session.get("is_login",None):
            login_sidebar = SideBar.objects.get(pk=5)
            login_sidebar.status = 0
            login_sidebar.save()
        context.update({
            "Created_time":queryset_created,
            "Updated_time":queryset_updated,
            "uv":uv
        })
        return context





class CategoryView(IndexView):
    def get_queryset(self):
        queryset = super().get_queryset()
        category_id = self.kwargs.get('category_id')
        return queryset.filter(category_id = category_id)

class TagView(IndexView):
    def get_queryset(self):
        queryset = super().get_queryset()
        tag_id = self.request.GET.get('tag')
        return queryset.filter(tag__id = tag_id)


class SearchView(IndexView):
    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        keyword = self.request.GET.get('keyword')
        context.update({
            'fail_message':'本次查询到0个结果!',
            'success_message':"本次关于'{}'查询到{}个结果！".format(keyword,self.get_queryset().count())
        })
        return context

    def get_queryset(self):
        queryset = super().get_queryset()
        keyword = self.request.GET.get('keyword')
        return queryset.filter(Q(title__icontains=keyword)|Q(desc__icontains=keyword))


class AchieveViews(IndexView):
    queryset = Post.latest_posts().order_by('-created_time')
    context_object_name = 'post'
    paginate_by = 10
    template_name = "blog/file.html"
