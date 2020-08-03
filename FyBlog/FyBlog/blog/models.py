from django.db import models
from django.utils.html import mark_safe
from markdown import markdown
from django.contrib.auth.models import User
from mdeditor.fields import MDTextField
from django.utils.html import format_html
import time

# Create your models here.

class Category(models.Model):
    STATUS_NORMAL = 0  # 正常
    STATUS_DELETE = 1  # 删除
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )
    name = models.CharField(max_length=255,verbose_name='分类名称')
    owner = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='分类作者')
    status = models.PositiveIntegerField(verbose_name='状态',default=STATUS_NORMAL,choices=STATUS_ITEMS)
    is_nav = models.BooleanField(default=False,verbose_name='是否为导航')
    created_time = models.DateTimeField(verbose_name='分类创建时间',auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = verbose_name_plural = "分类"


    @classmethod
    def get_all(cls):
        return cls.objects.filter(status=cls.STATUS_NORMAL)

class Tag(models.Model):
    STATUS_NORMAL = 0  # 正常
    STATUS_DELETE = 1  # 删除
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )
    name = models.CharField(verbose_name='标签名称',max_length=255)
    status = models.PositiveIntegerField(default=STATUS_NORMAL,choices=STATUS_ITEMS,verbose_name='状态')
    owner = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='标签作者')
    created_time = models.DateTimeField(verbose_name='标签创建时间',auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = verbose_name_plural = '标签'


class Post(models.Model):
    STATUS_NORMAL = 0  #正常
    STATUS_DELETE = 1  #删除
    STATUS_DRAFT = 2 #草稿
    STATUS_ITEMS =(
        (STATUS_NORMAL,'正常'),
        (STATUS_DELETE,'删除'),
        (STATUS_DRAFT,'草稿')
    )
    title = models.CharField(verbose_name='标题',max_length=255)
    desc = models.TextField(verbose_name='摘要', help_text='关于文章的简单描述')
    status = models.PositiveIntegerField(verbose_name='状态',default=STATUS_NORMAL,choices=STATUS_ITEMS)
    content = MDTextField(verbose_name='正文', help_text='正文必须是markdown格式')
    content_html = models.TextField(verbose_name='正文html代码', blank=True, editable=False)
    category = models.ForeignKey(Category,on_delete=models.CASCADE,verbose_name='分类')
    tag = models.ManyToManyField(Tag,verbose_name='标签')
    owner = models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='作者')
    created_time = models.DateTimeField(auto_now_add=True,verbose_name='文章创建时间')
    updated_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")
    uv = models.PositiveIntegerField(default=1)
    pv = models.PositiveIntegerField(default=1)


    class Meta:
        verbose_name = verbose_name_plural = '文章'

    def __str__(self):
        return self.title

    @classmethod
    def count(self):
        return self.objects.count()

    @classmethod
    def latest_posts(cls):
        queryset = cls.objects.filter(status=cls.STATUS_NORMAL)
        return queryset

    @classmethod
    def get_category(cls,id):
         queryset = cls.objects.filter(status=cls.STATUS_NORMAL).filter(category_id=id)
         return queryset


    def color_status(self):
        if self.status == self.STATUS_NORMAL:
            color = 'green'
        elif self.status == self.STATUS_DRAFT:
            color = 'brown'
        else:
            color = 'red'
        return format_html(
            '<span style="color:{}">{}</span>',
                color,
                self.STATUS_ITEMS[self.status][1]

        )

    color_status.short_description = "状态"