# Generated by Django 2.0.13 on 2019-06-10 00:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('arsenal', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='is_show',
            field=models.BooleanField(default=False, help_text='需要首页展示', verbose_name='首页展示'),
        ),
    ]
