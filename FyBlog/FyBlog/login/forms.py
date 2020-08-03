from django import forms
from django.forms import widgets
from blog.models import Category
from login.models import User

import re
import string

class RegisterForm(forms.Form):
    QUESTIONS_1 = 0
    QUESTIONS_2 = 1
    QUESTIONS_3 = 2
    QUESTIONS_4 = 3
    QUESTIONS_5 = 4

    Questions = (
        (QUESTIONS_1, "你的第一辆车？"),
        (QUESTIONS_2, "你初中学校的名字？"),
        (QUESTIONS_3, "你父亲的生日？"),
        (QUESTIONS_4, "你母亲的生日？"),
        (QUESTIONS_5, "你宠物的名字？")
    )

    nick = forms.CharField(label="昵称",widget=widgets.TextInput(attrs={'class':'input'}))
    Email = forms.EmailField(required=True,label="邮箱",error_messages={'required': '该字段不能为空',"invalid":"请输入正确的emil格式！"},
                             widget = widgets.TextInput(attrs={'class':"input"}))
    password = forms.CharField(required=True,label="密码",max_length=20,min_length=6,error_messages={'required': '密码不能为空',
                                                                                                  'max_length':'密码长度最少为20位',
                                                                                                  'min_length':"密码长度最少为6位"},
                               widget = widgets.PasswordInput(attrs={'class':"input"}),help_text="不少于20字符")
    re_password = forms.CharField(label="确认密码",max_length=20,error_messages={'requried': '两次输入的密码不一致！'},
                                  widget = widgets.PasswordInput(attrs={"class":"input"}))
    question1 = forms.IntegerField(widget=widgets.Select(choices=Questions,attrs={'class':'select'}),label="密保问题1",)
    answer1 = forms.CharField(label="答案",widget=widgets.TextInput(attrs={'class':'input'}))
    question2 = forms.IntegerField(widget=widgets.Select(choices=Questions, attrs={'class': 'select'}), label="密保问题2", )
    answer2 = forms.CharField(label="答案", widget=widgets.TextInput(attrs={'class': 'input'}))

    class Meta:
        model = User


    def clean_nick(self):
        cd = self.cleaned_data
        user = User.objects.filter(status=User.STATUS_NORMAL)
        for obj in user:
            if obj == None:
                break
            if cd['nick'] == obj.nick:
                raise forms.ValidationError('该昵称已被注册')
            else:
                pass

        return cd['nick']

    def clean_password(self):
        cd = self.cleaned_data
        num = [x for x in string.digits]
        letter = [x for x in string.ascii_letters]
        number_count = 0
        letter_count = 0
        for i in cd['password']:
            if i in num :
                number_count += 1
            if i in letter:
                letter_count += 1

        if number_count == 0 or letter_count == 0:
            raise forms.ValidationError("密码中必须包含英文和数字！")
        else:
            return cd['password']

    def clean_re_password(self):
        cd = self.cleaned_data
        try:
            if cd['re_password'] != cd["password"]:
                raise forms.ValidationError("两次密码不一致！")
            else:
                return cd['re_password']
        except KeyError:
            raise forms.ValidationError("两次密码不一致！")


    def clean_question2(self):
        cd = self.cleaned_data
        if cd['question2'] == cd['question1']:
            raise forms.ValidationError("两次问题不能相同！")
        else:
            return cd['question2']


    def clean_Email(self):
        cd = self.cleaned_data
        user = User.objects.filter(status=User.STATUS_NORMAL)
        for obj in user:
            if obj == None:
                break
            if cd['Email'] == obj.username:
                raise forms.ValidationError('该邮箱已被注册')
            else:
                pass

        return cd['Email']


class LoginForm(forms.Form):
    STATUS_ITEM = (
        (0,'不记住'),
        (1,'记住我')
    )

    Email = forms.EmailField(required=True, label="邮箱",
                             error_messages={'required': '该字段不能为空', "invalid": "请输入正确的emil格式！"},
                             widget=widgets.TextInput(attrs={'class': "input"}))
    password = forms.CharField(required=True, label="密码", max_length=20, min_length=6,
                               error_messages={'required': '密码不能为空',
                                               'max_length': '密码长度最少为20位',
                                               'min_length': "密码长度最少为6位"},
                               widget=widgets.PasswordInput(attrs={'class': "input"}), help_text="不少于20字符")
    remember = forms.CharField(required=False,widget=widgets.CheckboxInput,label='记住我')

    class Meta:
        meodel = User




    def clean_password(self):
        cd = self.cleaned_data
        if 'Email' in cd.keys():
            username = cd['Email']
            user = User.objects.filter(status=User.STATUS_NORMAL)
            for obj in user:
                if username == obj.username:
                    return cd['password']
                else:
                    pass

            raise forms.ValidationError('邮箱或者密码错误！')



