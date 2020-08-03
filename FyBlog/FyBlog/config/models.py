from django.db import models
from django.utils import timezone

# Create your models here.


class Link(models.Model):
    STATUS_NORMAL = 0
    STATUS_DELETE = 1
    STATUS_ITEMS = (
        (STATUS_NORMAL,'正常'),
        (STATUS_DELETE,'删除')
    )

    title = models.CharField(verbose_name='标题',max_length=255)
    href = models.URLField(verbose_name='链接')
    status = models.PositiveIntegerField(default=STATUS_NORMAL,choices=STATUS_ITEMS,verbose_name='状态')
    weight = models.IntegerField(verbose_name='权重',help_text='权重越高越优先,默认10',default=10)
    created_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = verbose_name_plural = '友情链接'

    @classmethod
    def get_all(cls):
        return cls.objects.filter(status=cls.STATUS_NORMAL)

class SideBar(models.Model):
    DISPLAY_HTML = 1
    DISPLAY_LATEST = 2
    DISPLAY_HOT = 3
    DISPLAY_COMMENT = 4

    SIDE_TYPE = (
        (1, "HTML"),
        (2, "最新文章"),
        (3, "最热文章"),
        (4, "最新评论")
    )
    STATUS_SHOW = 1
    STATUS_HIDE = 0
    STATUS_ITEMS = (
        (STATUS_SHOW, "正常"),
        (STATUS_HIDE, "删除")
    )
    title = models.CharField(max_length=50, verbose_name="标题")
    display_type = models.PositiveIntegerField(default=1, choices=SIDE_TYPE, verbose_name="展示类型")
    content = models.TextField(blank=True, verbose_name="内容", help_text="如果设置的不是HTML类型，可为空")
    status = models.PositiveIntegerField(default=STATUS_SHOW, choices=STATUS_ITEMS, verbose_name="状态")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")
    weight = models.IntegerField(default=100,help_text='权重，决定侧边栏展示的先后顺序，默认为100',verbose_name='权重')
    class_name = models.CharField(max_length=50,verbose_name='类名',default='gonggao')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = verbose_name_plural = "侧边栏"
        ordering = ['weight']

    @classmethod
    def get_all(cls):
        return cls.objects.filter(status=cls.STATUS_SHOW)


class Userip(models.Model):
    ip = models.CharField(verbose_name="ip地址",max_length=30)
    count = models.IntegerField(verbose_name="访问次数",default=0)

    class Meta:
        verbose_name = verbose_name_plural = "访问用户信息"

    def __str__(self):
        return self.ip


class VisitNumber(models.Model):
    count = models.IntegerField(verbose_name="网站访问总次数",default=0)
    class Meta:
        verbose_name = verbose_name_plural = "网站访问总次数"

    def __str__(self):
        return str(self.count)

class DayNumber(models.Model):
    day = models.DateTimeField(verbose_name="日期",default=timezone.now)
    count = models.IntegerField(verbose_name="网站访问次数",default=0)
    class Meta:
        verbose_name = verbose_name_plural = "网站日访问统计"

    def __str__(self):
        return str(self.day)


