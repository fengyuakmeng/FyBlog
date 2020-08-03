from django.shortcuts import render
from django.views.generic import View
from django.shortcuts import HttpResponse,redirect,reverse,HttpResponseRedirect
from django.core.mail import EmailMultiAlternatives
from blog.models import Category,Tag
from login.forms import RegisterForm,LoginForm
from login.models import EmailPro
from login.models import User
from login.views import hash_md5
from forget_password.forms import CheckForm,EmailForm,ResetpasswdForm
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


class forget_password(CommonView, View):

    def get(self, request):
        template = "blog/email.html"
        context = {}
        ForgetForm = EmailForm()
        context = super().get_data()
        context.update({
            "form": ForgetForm

        })
        return render(request, template, context)


class choose(CommonView, View):
    def get(self, request, *args, **kwargs):
        email = kwargs['username']
        if request.session.get('token') == hash_md5(email):
            template = "blog/question_or_email.html"
            context = super().get_data(**kwargs)
            return render(request, template, context)
        else:
            return HttpResponse("非法操作")


    def post(self, request):
        template = "blog/question_or_email.html"
        context = super().get_data()
        email = request.POST.get('Email')
        ForgetForm = EmailForm(request.POST)
        if ForgetForm.is_valid():
            request.session['token'] = hash_md5(email)
            request.session['email'] = email
            return render(request,template,context)
        else:
            context = super().get_data()
            template = "blog/email.html"
            context.update({
                'form': ForgetForm
            })
            return render(request,template,context)


class checking(CommonView,View):

    def post(self, request):
        CODE_Form = CheckForm()
        reset_Form = ResetpasswdForm()
        email = request.session.get('email')
        choose_id = request.POST.get('choose')
        template = "blog/checking_page.html"
        context = super().get_data()
        if choose_id:
            if choose_id == "email":
                context.update({
                    "value":"email",
                    "email":email,
                    "codeform":CODE_Form,
                    "resetform":reset_Form
                })
                send_register_email.delay(email,send_type = "forget" )
                return render(request,template,context)
            elif choose_id == "question":
                userobj = User.objects.filter(status=User.STATUS_NORMAL).get(username=email)
                first_question = userobj.question1
                second_question = userobj.question2
                context.update({
                    'first':User.Questions[first_question][1],
                    "second":User.Questions[second_question][1],
                    "value_question1":first_question,
                    "value_question2":second_question,
                    "value": "question",
                    "email": email,
                    "resetform": reset_Form
                })
                return render(request, template, context)
            else:
                return HttpResponse('非法操作')
        else:
            return HttpResponse('非法操作')


class complate(CommonView,View):

    def post(self,request):
        value = request.POST.get("value")
        email = request.session.get('email')
        passwd = request.POST.get('passwd')
        if value:
            if value == "email":
                code = request.POST.get('code')
                Emailobj = EmailPro.objects.filter(status=EmailPro.STATUS_NORMAL).filter(send_type="forget").filter(email=email).order_by('-id')[0]
                checking_code = Emailobj.code
                Codeform = CheckForm(request.POST)
                ResetForm = ResetpasswdForm(request.POST)
                if Codeform.is_valid():
                    if ResetForm.is_valid():
                        if code == checking_code:
                            userobj = User.objects.filter(status=User.STATUS_NORMAL).get(username=email)
                            userobj.password = hash_md5(passwd)
                            userobj.save()
                            context = super().get_data()
                            template = "blog/complate_page.html"
                            context.update({
                                "email":email
                            })
                            return render(request, template, context)
                        else:
                            Codeform.add_error("code","验证码错误！")
                            context = super().get_data()
                            template = "blog/checking_page.html"
                            context.update({
                                'codeform': Codeform,
                                "resetform": ResetForm,
                                "value": value
                            })
                            return render(request,template,context)
                    else:
                        context = super().get_data()
                        template = "blog/checking_page.html"
                        context.update({
                            'codeform': Codeform,
                            "resetform": ResetForm,
                            "value": value
                        })
                        return render(request, template, context)

                else:
                    context = super().get_data()
                    template = "blog/checking_page.html"
                    context.update({
                        'codeform': Codeform,
                        "resetform": ResetForm,
                        "value":value
                    })
                    return render(request, template, context)
            elif value == "question":
                reset_Form = ResetpasswdForm()
                question_id = int(request.POST.get("question"))
                anwser = request.POST.get('answer')
                userobj = User.objects.filter(status=User.STATUS_NORMAL).get(username = email)
                question1 = userobj.question1
                question2 = userobj.question2
                anwser1 = userobj.anwser1
                anwser2 = userobj.anwser2
                QA_mapping = {  #数据库问题答案映射关系
                    question1:anwser1,
                    question2:anwser2
                }
                current_anwser = QA_mapping[question_id]
                if anwser == current_anwser:
                    reset_Form = ResetpasswdForm(request.POST)
                    if reset_Form.is_valid():
                        userobj.password = hash_md5(passwd)
                        userobj.save()
                        context = super().get_data()
                        template = "blog/complate_page.html"
                        context.update({
                            "email": email
                        })
                        return render(request, template, context)
                    else:
                        template = "blog/checking_page.html"
                        context = super().get_data()
                        first_question = userobj.question1
                        second_question = userobj.question2
                        context.update({
                        'first': User.Questions[first_question][1],
                        "second": User.Questions[second_question][1],
                        "value_question1": first_question,
                        "value_question2": second_question,
                        "value": value,
                        "email": email,
                        "resetform": reset_Form
                    })
                        return render(request, template, context)

                else:
                    error_message = "输入的答案有误，请重新输入！"
                    context = super().get_data()
                    template = "blog/checking_page.html"
                    first_question = userobj.question1
                    second_question = userobj.question2
                    context.update({
                        'first': User.Questions[first_question][1],
                        "second": User.Questions[second_question][1],
                        "value_question1": first_question,
                        "value_question2": second_question,
                        "value": value,
                        "error_message": error_message,
                        "email": email,
                        "resetform": reset_Form
                    })
                    return render(request, template, context)
            else:
                return HttpResponse("非法操作！")
        else:
            return HttpResponse("未知的操作！")