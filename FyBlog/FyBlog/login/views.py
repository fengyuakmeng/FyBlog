from django.shortcuts import render
from django.views.generic import View
from django.shortcuts import HttpResponse,redirect,reverse,HttpResponseRedirect
from django.core.mail import EmailMultiAlternatives
from blog.models import Category,Tag
from login.forms import RegisterForm,LoginForm
from login.models import EmailPro
from login.models import User
from config.models import SideBar
from Cryptodome.Cipher import DES
import binascii
import base64
import hashlib
from FyBlog import settings
from login.tasks import send_register_email
import datetime
# Create your views here.


class CommonView:
    def get_data(self,**kwargs):
        context = {}
        for key,value in kwargs.items():
            context.update({
                key:value
            })
        context.update({
            'categorys': Category.get_all(),
            'tags': Tag.objects.filter(status=Tag.STATUS_NORMAL),
        })
        return context

class login(View):
    template = "blog/login.html"
    context = {}
    def __init__(self,**kwargs):
        super(View,self).__init__(**kwargs)

    def get(self,request):
        next = request.GET.get('next')
        form = LoginForm()
        self.context.update({
            'form':form,
            "next":next
        })

        return render(request,self.template,self.context)


    def post(self,request):
        template = "blog/login.html"
        context = {}
        next = request.POST.get('next')
        form = LoginForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            username = cd['Email']
            password = cd['password']
            remember = 'on' if request.POST.get('remember') else None
            db_user = User.objects.get(username=username)
            if username == db_user.username and hash_md5(password) == db_user.password:
                template = 'blog/list.html'
                nick = db_user.nick
                uid = db_user.id
                current_time = datetime.datetime.utcnow()
                current_data = current_time + datetime.timedelta(seconds=10)
                url =  next
                response = redirect(url)
                request.session['username'] = hash_md5(username)
                request.session['uid'] = uid
                request.session['nick'] = nick
                request.session['is_login'] = True
                if remember:
                    pass
                else:
                    request.session.set_expiry(0)
                return response
            else:
                form.add_error('password','邮箱或者密码错误！')
                context.update({
                    'form': form,
                    "next":next
                })
                return render(request, template, context)


        else:
            context.update({
                'form': form
            })
            return render(request, template, context)


def hash_md5(text):
    if not isinstance(text,str):
        raise TypeError("类型错误，str！")
    else:
        md5 = hashlib.md5()
        context = text.encode("utf-8")
        md5.update(context)
        md5_str = md5.hexdigest()
        return md5_str


def des(text,type="encrypt"):
    if not isinstance(text,str):
        raise TypeError("类型错误，str！")
    key = b'FyBlogss'
    des = DES.new(key, DES.MODE_ECB)
    if type == "encrypt":
        token = text + (8 - (len(text) % 8)) * '@'
        encrypto_text = des.encrypt(token.encode())
        encrypto_text = str(binascii.b2a_hex(encrypto_text), encoding="utf-8")
        return encrypto_text
    elif type == "decrypt":
        after_text = binascii.a2b_hex(text)
        decrypto_text = str(des.decrypt(after_text), encoding="utf-8").rstrip("@")
        return decrypto_text


def register_success(status,token):
    template = "blog/register.html"
    context = {}
    username = str(base64.b64decode(token),encoding="utf-8")
    encrypto_text = des(token)
    url = "http://" + settings.WEBSITE_URL + '/login/register/?status=ToBeActive&token={}'.format(encrypto_text)
    send_register_email.delay(username,url,encrypto_text)

    status = "info"
    message = """
            验证邮件已发送到{}，欢迎加入FyBlog,请前往注册邮箱验证账号，激活邮件将在1-2分钟之内发送到您的邮箱中，链接<strong>3天</strong>内有效！<br>
            <a href="/blog/index">返回主页</a>
    """.format(username)
    context.update({
        "status":status,
        "username":username,
        "title":"注册成功！",
        "message":message
    })
    return context,template


def register_checking(status,token):
    template = "blog/register.html"
    context = {}
    decrypto_text = des(token,type="decrypt")
    username = str(base64.b64decode(decrypto_text),encoding="utf-8")
    Email = EmailPro.objects.filter(status=EmailPro.STATUS_NORMAL)

    for obj in Email:
        now = datetime.datetime.now().strftime('%Y-%m-%d')
        register = obj.send_time.strftime('%Y-%m-%d')
        d1 = datetime.datetime.strptime(now,'%Y-%m-%d')
        d2 = datetime.datetime.strptime(register, '%Y-%m-%d')
        print((d1-d2).days)
        if (d1-d2).days > 3:
            message = """链接失效或已激活过!<br>
                             <a href="/login/">前往登陆</a>&nbsp&nbsp<a href="/blog/index">返回主页</a>
                """
            status = "danger"
            context.update({
                "message": message,
                "status": status
            })
            return context, template
        if obj.email == username and obj.code == token:
            status = "success"
            message = """
                    {},账号激活成功,来登陆你的账号吧！<br>
                    <a href="/login/">前往登陆</a>&nbsp&nbsp<a href="/blog/index">返回主页</a>
            """.format(username)
            context.update({
                'status':status,
                'username':username,
                'title':'邮箱验证成功！',
                'message':message
            })
            obj.status = EmailPro.STATUS_DEL
            obj.save()
            user = User.objects.get(username=username)
            user.isActive = 1
            user.save()
            return context,template
        else:
            pass

    message = """链接失效或已激活过!<br>
                 <a href="/login/">前往登陆</a>&nbsp&nbsp<a href="/blog/index">返回主页</a>
    """
    status = "danger"
    context.update({
        "message":message,
        "status":status
    })
    return context,template



class type_judge(View):
    def get(self,request):
        status = request.GET.get('status')
        if status:
            if status == "success":
                token = request.GET.get('token')
                context,template = register_success(status,token)
                return render(request, template, context)
            if status == "ToBeActive":
                token = request.GET.get('token')
                context,template = register_checking(status,token)
                return render(request, template, context)


        else:
            template = "blog/register.html"
            context = {}
            form = RegisterForm
            context.update({
                'form': form
            })
            return render(request, template, context)

    def post(self,request):
        template = "blog/register.html"
        context = {}
        form = RegisterForm(request.POST)
        if form.is_valid():
            Email = form.cleaned_data['Email']
            password = form.cleaned_data['password']
            question_1 = form.cleaned_data['question1']
            answer_1 = form.cleaned_data['answer1']
            question_2 = form.cleaned_data['question2']
            answer_2 = form.cleaned_data['answer2']
            register_User = User()
            register_User.username = Email
            register_User.password = hash_md5(password)
            register_User.question1 = question_1
            register_User.anwser1 = answer_1
            register_User.question2 = question_2
            register_User.anwser2 = answer_2
            register_User.save()
            context.update({
                'token': str(base64.b64encode(Email.encode("utf-8")), "utf-8"),
                "status": "success"
            })
            url = reverse('register_status')
            return redirect('/login/register_status/?status={}&token={}'.format(context['status'], context['token']))
        else:
            context.update({
                "form": form,
                "title":"注册"
            })

            return render(request, template, context)



def logout(request):
    del request.session['username']
    del request.session['uid']
    del request.session['nick']
    del request.session['is_login']
    login_sidebar = SideBar.objects.get(pk=5)
    login_sidebar.status = 1
    login_sidebar.save()
    return redirect('index')



