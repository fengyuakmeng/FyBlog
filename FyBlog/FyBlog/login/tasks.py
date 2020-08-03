from __future__ import absolute_import
from celery.task import task
from celery import Task
from celery.utils.log import get_task_logger
from login.models import EmailPro,User
from FyBlog import settings
import random
from django.core.mail import EmailMultiAlternatives
from FyBlog.celery import app


class MyTask(Task):
    def on_success(self, retval, task_id, args, kwargs):
        print('task done: {0}'.format(retval))
        return super(MyTask, self).on_success(retval, task_id, args, kwargs)
    def on_failure(self, exc, task_id, args, kwargs, einfo):
        print('task fail, reason: {0}'.format(exc))
        return super(MyTask, self).on_failure(exc, task_id, args, kwargs, einfo)


@app.task(base = MyTask)
def send_register_email(Email,url="",token="",send_type="register"):

    email_pro = EmailPro()
    email_pro.code = ""
    email_pro.email = Email
    email_pro.send_type = send_type
    email_pro.save()
    count = User.objects.all().count() + 1
    email_title= ""
    email_body = ""
    if send_type == "register":
        email_pro.code = token
        email_pro.save()
        email_title="FyBlog注册链接"
        email_body = "<div>感谢你的注册，你是本站第{}位用户</div>" \
                     "<div>请点击下方的链接激活你的账号：</div>" \
                     "<a href='{}'>{}</a>，<strong>一个小时</strong>之内有效。".format(count,url,url)
    elif send_type == "forget":
        checking_code = random.randrange(1000,9999)
        email_pro.code = checking_code
        email_pro.save()
        email_title = "FyBlog找回密码"
        email_body = "<div>此邮件用于{}账号的密码找回</div>" \
                     "<div>请保管好验证码，切勿泄露给他人</div>" \
                     "<div>验证码为：<strong>{}</strong></div>"\
                    "<div>来自FyBlog</div>".format(Email,checking_code)
    else:
        pass
    send_status = EmailMultiAlternatives(email_title,email_body,settings.EMAIL_FROM,[Email])
    send_status.content_subtype = "html"
    send_status.send()
    return email_title


