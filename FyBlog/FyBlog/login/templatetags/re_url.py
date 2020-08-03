from django import template
register = template.Library()

@register.filter(name='cut')  # 过滤器在模板中使用时的name
def myCut(value, arg):
    return value.replace("@", arg)


