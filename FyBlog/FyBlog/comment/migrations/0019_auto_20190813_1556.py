# Generated by Django 2.1.1 on 2019-08-13 15:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('comment', '0018_auto_20190811_1344'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reply',
            name='reply_comment',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comment.Comment', verbose_name='回复评论'),
        ),
    ]
