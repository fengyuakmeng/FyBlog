from django.shortcuts import render,redirect
from login.models import User
from blog.models import Post
from user.forms import UserForm
from comment.models import Comment
from login.views import hash_md5
from django.views.generic import DetailView,ListView,View
# Create your views here.

class CommonView:
    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        user_id = self.kwargs.get('user_id')
        userobj = User.objects.get(id=user_id)
        sex = User.SEX[userobj.sex][1]
        uid = self.request.session.get('uid', None)
        if uid:
            current_uid = self.kwargs.get('user_id')
            if uid == current_uid:
                context.update({
                    "is_master": True
                })
        context.update({
            "sex": sex,
            "user":userobj
        })
        return context

class IndexView(CommonView,ListView):
    queryset = Comment.latest_posts()
    context_object_name = 'comment'
    paginate_by = 4
    template_name = 'blog/user_index.html'

    def get_queryset(self):
        all_query = []
        user_id = self.kwargs.get('user_id')
        queryset = super().get_queryset().filter(comment_user=user_id)
        for obj in queryset:
            post_id = obj.target.id
            postobj = Post.objects.get(id=post_id)
            all_query.append(postobj)
        query = list(zip(queryset,all_query))
        return query

class EditView(CommonView,ListView):
    queryset = Comment.latest_posts()
    context_object_name = 'comment'
    paginate_by = 5
    template_name = 'blog/user_edit.html'

    def get_context_data(self,**kwargs):
        context = super().get_context_data(**kwargs)
        user_obj = User.objects.get(id=self.kwargs.get('user_id'))
        userform = UserForm(instance=user_obj)
        template = 'blog/user_edit.html'
        context.update({
            "userform":userform
        })
        return context



    def post(self, request, *args, **kwargs):
        user_obj = User.objects.get(id=self.kwargs.get('user_id'))
        userform = UserForm(request.POST,instance=user_obj)
        avatars = request.FILES.get('avatars',None)
        passwd = request.POST.get('password')
        if userform.is_valid():
            user = userform.save(commit=False)
            user.password = hash_md5(passwd)
            if avatars:
                user.avatars = avatars
            a = user.save()
            url = '/user/{}'.format(self.kwargs.get('user_id'))
            return redirect(url)
