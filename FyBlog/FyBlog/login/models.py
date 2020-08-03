from django.db import models
import datetime
import  django.utils.timezone as timezone
# Create your models here.


class User(models.Model):
    MALE = 0
    FEMALE = 1
    SECRET = 2
    SEX = (
        (MALE,"男"),
        (FEMALE,"女"),
        (SECRET,"保密")
    )

    QUESTIONS_1 = 0
    QUESTIONS_2 = 1
    QUESTIONS_3 = 2
    QUESTIONS_4 = 3
    QUESTIONS_5 = 4
    QUESTIONS_6 = 5
    Questions = (
        (QUESTIONS_1, "你的第一辆车？"),
        (QUESTIONS_2, "你初中学校的名字？"),
        (QUESTIONS_3, "你父亲的生日？"),
        (QUESTIONS_4, "你母亲的生日？"),
        (QUESTIONS_5, "你宠物的名字？")
    )

    STATUS_NORMAL = 0
    STATUS_AUDIT = 1
    STATUS_DELETE = 2
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_AUDIT, '审核'),
        (STATUS_DELETE, '删除'),
    )

    username = models.EmailField(verbose_name="邮箱",max_length=20)
    password = models.CharField(verbose_name="密码",max_length=100)
    nick = models.CharField(verbose_name="昵称",max_length=10,default="123")
    question1 = models.PositiveIntegerField(verbose_name="密保问题1",choices=Questions)
    anwser1 = models.CharField(verbose_name="答案1",max_length=255)
    question2 = models.PositiveIntegerField(verbose_name="密保问题2",choices=Questions)
    anwser2 = models.CharField(verbose_name="答案1",max_length=255)
    birthday = models.DateField(verbose_name="生日",default=datetime.datetime.today())
    status = models.PositiveIntegerField(verbose_name="用户状态",choices=STATUS_ITEMS,default=STATUS_NORMAL)
    created_time = models.DateTimeField(verbose_name="创建时间",auto_now_add=True)
    sex = models.PositiveIntegerField(verbose_name="性别",choices=SEX,default=3)
    uid = models.CharField(verbose_name="用户id",max_length=255,default="u001")
    isActive = models.IntegerField(verbose_name='是否激活',default=0)
    avatars = models.ImageField(upload_to='avatars',default='avatars/default.png',verbose_name="头像")
    introduction = models.TextField(verbose_name="个人简介",default="I'm the monster")

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = verbose_name_plural = '用户'

    @classmethod
    def latest_posts(cls):
        queryset = cls.objects.filter(status=cls.STATUS_NORMAL)
        return queryset



class EmailPro(models.Model):
    STATUS_NORMAL = 0
    STATUS_DEL = 1
    STATUS_ITEMS = (
        (STATUS_NORMAL, '未激活'),
        (STATUS_DEL, '删除'),
    )
    code = models.CharField(max_length=100,verbose_name="验证码")
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    status = models.PositiveIntegerField(verbose_name="验证",choices=STATUS_ITEMS,default=STATUS_NORMAL)
    send_type = models.CharField(max_length=10,choices=(('register',"邮箱注册"),("forget","忘记密码")),verbose_name="发送类型")
    send_time = models.DateTimeField(auto_now_add=True,verbose_name="发送时间")

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name