from datetime import datetime

from django.db import models


class WebConfig(models.Model):
    title = models.CharField(unique=True, max_length=20, verbose_name="网站名称",
                             help_text="网站名称")
    web_keywords = models.CharField(default="", max_length=200, null=True, blank=True, verbose_name="搜索关键字",
                                    help_text="搜索关键字，seo用到")
    web_desc = models.CharField(default="", max_length=200, null=True, blank=True, verbose_name="网站简介",
                                help_text="网站简介")
    main_mini_logo = models.ImageField(max_length=200, upload_to="main_logo", null=True, blank=True, verbose_name="首页小logo",
                                  help_text="首页侧边栏收起时的 小logo,大小是:80x80")
    main_big_logo = models.ImageField(max_length=200, upload_to="main_logo", null=True, blank=True, verbose_name="首页大logo",
                                       help_text="首页侧边栏展开时的 大logo,大小是:178x40")
    favicon = models.ImageField(max_length=200, upload_to="main_logo", null=True, blank=True, verbose_name="网站标签栏logo",
                                      help_text="网站标签栏logo,大小是:64x64")
    is_running = models.BooleanField(default=False, verbose_name="是否当前正在运行", help_text="是否当前正在运行")

    def __str__(self):
        return self.title

    class Meta:
        db_table = "tb_webconfig"
        verbose_name = "网站配置"
        verbose_name_plural = verbose_name


class Category(models.Model):
    category = models.CharField(unique=True, max_length=20, verbose_name="类别",
                                help_text="类别")
    webconfig = models.ForeignKey(WebConfig, related_name="website_category", on_delete=models.CASCADE,
                                  verbose_name="网站设置", help_text="网站设置")
    sn = models.CharField(blank=True, null=True, max_length=20, verbose_name="随机英文ID",
                          help_text="随机英文ID")
    weight = models.IntegerField(default=0, blank=True, verbose_name="权重", help_text="权重")
    cat_is_show = models.BooleanField(default=False, verbose_name="首页展示", help_text="类别需要首页展示")
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
    ws_is_show = models.BooleanField(default=False, verbose_name="首页展示", help_text="网站需要首页展示")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return str(self.id)

    class Meta:
        db_table = "tb_website"
        verbose_name = "网站"
        verbose_name_plural = verbose_name

class WebsiteRecommend(models.Model):
    pass