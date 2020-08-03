from django.db import models
from blog.models import Post
from login.models import User
# Create your models here.

class Comment(models.Model):
    STATUS_NORMAL = 0
    STATUS_AUDIT = 1
    STATUS_DELETE = 2
    STATUS_ITEMS = (
        (STATUS_NORMAL,'正常'),
        (STATUS_AUDIT,'审核'),
        (STATUS_DELETE,'删除'),
    )
    
    comment_user  = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name="评论用户")
    comment_text = models.TextField(verbose_name='评论内容')
    created_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')
    status = models.PositiveIntegerField(default=STATUS_NORMAL,choices=STATUS_ITEMS,verbose_name='评论状态')
    target = models.ForeignKey(Post,on_delete=models.CASCADE,verbose_name="评论目标",related_name='posts')
    comment_parent_id = models.IntegerField(verbose_name="上级评论id",default=0)

    def __str__(self):
        if len(self.comment_text) > 4:
            return self.comment_text[:5] + "..."
        else:
            return self.comment_text

    class Meta:
        verbose_name = verbose_name_plural = '评论'

    @classmethod
    def count(cls):
        return cls.objects.count()

    @classmethod
    def latest_posts(cls):
        queryset = cls.objects.filter(status=cls.STATUS_NORMAL)
        return queryset

    @classmethod
    def count_posts(cls):
        return id
