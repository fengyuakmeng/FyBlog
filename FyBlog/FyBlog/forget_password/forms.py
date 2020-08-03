from django import forms
from django.forms import widgets
from blog.models import Category
from login.models import User

import re
import string

class EmailForm(forms.Form):
    Email = forms.EmailField(required=True,label="请输入你的邮箱：",error_messages={'required': '该字段不能为空', "invalid": "请输入正确的emil格式！"},
                             widget=widgets.TextInput(attrs={'class': "input"}))


    def clean_Email(self):
        cd = self.cleaned_data
        email = cd['Email']
        Userobj = User.objects.filter(status=User.STATUS_NORMAL)
        for user in Userobj:
            if user.username == email:
                return cd['Email']
            else:
                pass

            raise forms.ValidationError('用户不存在！')

class CheckForm(forms.Form):
    code = forms.CharField(required=True, label="验证码：",
                             error_messages={'required': '该字段不能为空', "invalid": "请输入正确的格式！"},
                             widget=widgets.TextInput(attrs={'class': "input"}))



class ResetpasswdForm(forms.Form):
    passwd = forms.CharField(required=True, label="密码：",
                             max_length=20,
                             error_messages={'required': '该字段不能为空', "invalid": "请输入正确的格式！"},
                             widget = widgets.PasswordInput(attrs={"class":"input"}))
    re_passwd = forms.CharField(required=True, label="确认密码：",
                                max_length=20,
                                error_messages={'required': '该字段不能为空', "invalid": "请输入正确的格式！"},
                                widget = widgets.PasswordInput(attrs={"class":"input"}))


    def clean_re_passwd(self):
        cd = self.cleaned_data
        try:
            if cd['re_passwd'] != cd["passwd"]:
                raise forms.ValidationError("两次密码不一致！")
            else:
                return cd['re_passwd']
        except KeyError:
            raise forms.ValidationError("两次密码不一致！")

