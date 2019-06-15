from datetime import datetime

from django.db import models


class WebConfig(models.Model):
    title = models.CharField(unique=True, max_length=20, verbose_name="网站名称",
                             help_text="网站名称")
    web_desc = models.CharField(default="", max_length=200, null=True, blank=True, verbose_name="网站简介",
                                help_text="网站简介")
    main_logo = models.ImageField(max_length=200, upload_to="main_logo", null=True, blank=True)
    main_url = models.URLField(max_length=300, verbose_name="网站url", help_text="网站url")
    is_running = models.BooleanField(default=False, verbose_name="是否当前正在运行", help_text="是否当前正在运行")


class Category(models.Model):
    category = models.CharField(unique=True, max_length=20, verbose_name="类别",
                                help_text="类别")
    webconfig = models.ForeignKey(WebConfig, related_name="website_category", on_delete=models.CASCADE,
                                 verbose_name="网站设置", help_text="网站设置")
    sn = models.CharField(blank=True, null=True, max_length=20, verbose_name="随机英文ID",
                          help_text="随机英文ID")
    weight = models.IntegerField(default=0, blank=True, verbose_name="权重", help_text="权重")
    is_show = models.BooleanField(default=False, verbose_name="首页展示", help_text="需要首页展示")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.category

    class Meta:
        db_table = "tb_category"
        verbose_name = "类别"
        verbose_name_plural = verbose_name


class Website(models.Model):
    name = models.CharField(unique=True, max_length=20, verbose_name="网站名称",
                            help_text="网站名称")
    desc = models.CharField(default="", max_length=29, null=True, blank=True, verbose_name="简介",
                            help_text="简介")
    url = models.URLField(max_length=300, verbose_name="网站url", help_text="网站url")
    logo = models.ImageField(max_length=200, upload_to="logo", null=True, blank=True)
    category = models.ForeignKey(Category, related_name="website_category", on_delete=models.CASCADE,
                                 verbose_name="类别", help_text="类别")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return str(self.id)

    class Meta:
        db_table = "tb_website"
        verbose_name = "网站"
        verbose_name_plural = verbose_name
