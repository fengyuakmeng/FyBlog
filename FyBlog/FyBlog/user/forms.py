from django.forms import ModelForm
from login.models import User
from django.forms import widgets
class UserForm(ModelForm):
    class Meta:
        model = User
        fields = "__all__"
        exclude = ['username','nick','status','uid','isActive',]
        labels = None

        help_texts = None
        widgets = {
            "password": widgets.Input(attrs={"class": "input"}),
            "question1": widgets.Select(attrs={"class": "input"}),
            "anwser1": widgets.Input(attrs={"class": "input"}),
            "question2": widgets.Select(attrs={"class": "input"}),
            "anwser2": widgets.Input(attrs={"class": "input"}),
            "birthday":widgets.DateInput(format=('%Y-%m-%d'),attrs={'type':'date','class':"input"}),
            "sex": widgets.Select(attrs={"class": "input"}),

            "introduction":widgets.Textarea(attrs={"class": "textarea","rows":4}),

        }
        error_messages = None
