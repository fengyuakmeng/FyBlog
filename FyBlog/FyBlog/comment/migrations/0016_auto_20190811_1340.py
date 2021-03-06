# Generated by Django 2.1.1 on 2019-08-11 13:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('comment', '0015_auto_20190722_2207'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='comment_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='login.User', verbose_name='评论用户'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='target',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='blog.Post', verbose_name='评论目标'),
        ),
        migrations.AlterField(
            model_name='reply',
            name='reply_comment',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='comment.Comment', verbose_name='回复评论'),
        ),
        migrations.AlterField(
            model_name='reply',
            name='reply_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='login.User', verbose_name='回复用户'),
        ),
    ]
