# -*- coding: utf-8 -*-
from random import choice

import xadmin
from xadmin import views

from .util import generate_sn
from .models import Category
from .models import Website
from .models import WebConfig


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "网址导航 Admin管理后台"
    site_footer = "网址导航 Admin管理后台"
    menu_style = "accordion"
    apps_icons = {"appname": "icon"}

    def get_site_menu(self):
        return (
            {'title': '站点管理', 'menus': (
                {'title': '全局配置', 'url': self.get_model_url(WebConfig, 'changelist')},
                {'title': '类别管理', 'url': self.get_model_url(Category, 'changelist')},
                {'title': '网址管理', 'url': self.get_model_url(Website, 'changelist')},
            )},
        )


class WebConfigAdmin(object):
    list_display = ['title', 'web_keywords', 'web_desc', 'main_mini_logo', 'main_big_logo', 'favicon', 'is_running']
    search_fields = ['title', 'is_running']
    list_filter = ['title', 'is_running']
    list_editable = ['title', 'web_keywords', 'web_desc', 'main_mini_logo', 'main_big_logo', 'favicon', 'is_running']
    model_icon = 'fa fa-address-book-o'


class CategoryAdmin(object):
    list_display = ['id', 'sn', 'category', 'weight', 'is_show', 'webconfig']
    search_fields = ['id', 'sn', 'category', 'weight', 'is_show', 'webconfig']
    list_filter = ['id', 'sn', 'category', 'weight', 'is_show', 'webconfig']
    list_editable = ['category', 'weight', 'is_show']
    readonly_fields = ['sn']
    model_icon = 'fa fa-address-book-o'

    def save_models(self):
        self.new_obj.sn = generate_sn()
        self.new_obj.save()


class WebsiteAdmin(object):
    list_display = ['id', 'name', 'desc', 'url', 'logo', 'category', 'add_time']
    search_fields = ['id', 'name', 'category', 'url']
    list_filter = ['id', 'name', 'category', 'url']
    list_editable = ['name', 'desc', 'url', 'logo']
    model_icon = 'fa fa-address-book-o'
    relfield_style = 'fk-ajax'


xadmin.site.register(WebConfig, WebConfigAdmin)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Website, WebsiteAdmin)

xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)
