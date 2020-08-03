from django.contrib import admin
from django.urls import reverse
from django.utils.html import format_html
from comment.models import Comment

# Register your models here.


@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('id','comment_user','status',"comment_parent_id",'comment_text','created_time','target','operator')
    list_display_links = ['comment_user']
    field = ('comment_text','target','status','comment_parent_id')

    def operator(self,obj):
        return format_html(
            '<a href="{}">编辑</a>',reverse('admin:comment_comment_change',args=(obj.id,))
        )
    operator.short_description = "操作"



# @admin.register(Reply)
# class ReplyAdmin(admin.ModelAdmin):
#     list_display = ('reply_user', 'status', 'reply_content', 'created_time', 'operator')
#     fields = ('reply_user','reply_content','reply_comment','status')
#
#     def operator(self,obj):
#         return format_html(
#             '<a href="{}">编辑</a>',reverse('admin:comment_reply_change',args=(obj.id,))
#         )
#     operator.short_description = "操作"

