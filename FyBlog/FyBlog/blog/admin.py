from django.contrib import admin

from django.urls import reverse
from django.utils.html import format_html
from blog.models import Category,Tag,Post
from FyBlog.base_admin import BaseOwnerAdmin

# Register your models here.

admin.site.site_header = "FyBlog后台管理系统"
admin.site_title ="FyBlog后台管理系统"

@admin.register(Category)
class CategoryAdmin(BaseOwnerAdmin):
    list_display = ('name', 'status', 'is_nav', 'created_time', 'post_count', 'owner')
    fields = ('name','status', 'is_nav')

    def post_count(self,obj):
        return obj.post_set.count()
    post_count.short_description = "文章数量"


class CategoryOwnerFilter(admin.SimpleListFilter):
    title = '分类'
    parameter_name = 'owner_category'

    def lookups(self, request, model_admin):
        return Category.objects.filter(owner=request.user).values_list('id', 'name')

    def queryset(self, request, queryset):
        category_id = self.value()
        if category_id:
            return queryset.filter(category_id=self.value())
        return queryset



@admin.register(Tag)
class TagAdmin(BaseOwnerAdmin):
    list_display = ('name','status','created_time','post_count','owner')
    Fields = ('name','owner','status')

    def post_count(self,obj):
        return obj.post_set.count()
    post_count.short_description = '文章数量'



@admin.register(Post)
class PostAdmin(BaseOwnerAdmin):
    list_display = ['title','color_status','category','owner','created_time','updated_time','uv','pv','operator']
    fields = (
        ('category', 'title'),
        "desc",
        'status',
        'content',
        'tag',
    )
    list_filter = (CategoryOwnerFilter,)
    search_fields = ['title', 'category__name']

    def operator(self,obj):
        return format_html(
            '<a href="{}">编辑</a>',reverse('admin:blog_post_change',args=(obj.id,))
        )
    operator.short_description = "操作"


    def save_model(self, request, obj, form, change):
        obj.content_html = request.POST.get('id_content-wmd-wrapper-html-code')
        obj.owner = request.user
        obj.save()
