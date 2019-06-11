# -*- coding: utf-8 -*-
from random import choice

import xadmin
from xadmin import views
from xadmin.plugins.auth import UserAdmin
from xadmin.layout import Fieldset, Main, Side, Row
from django.utils.translation import ugettext as _

from .models import Category
from .models import Website


def generate_sn():
    """
    生成八位数字的SN
    :return:
    """
    seeds = "abcdefghijklmnopqrstuvwsyz"
    random_str = []
    for i in range(8):
        random_str.append(choice(seeds))
    sn = "".join(random_str)
    # 去重处理，保证 sn 唯一性
    if Category.objects.filter(sn=sn):
        generate_sn()
    return sn


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
                {'title': '类别管理', 'url': self.get_model_url(Category, 'changelist')},
                {'title': '网址管理', 'url': self.get_model_url(Website, 'changelist')},
            )},
        )


class CategoryAdmin(object):
    list_display = ['id', 'sn', 'category', 'weight', 'is_show']
    search_fields = ['id', 'sn', 'category', 'weight', 'is_show']
    list_filter = ['id', 'sn', 'category', 'weight', 'is_show']
    list_editable = ['category', 'weight', 'is_show']
    sn = generate_sn()
    # prepopulated_fields = {'sn': generate_sn()}
    readonly_fields = ['sn']
    model_icon = 'fa fa-address-book-o'

    def save_models(self):
        self.new_obj.sn = self.sn
        self.new_obj.save()


class WebsiteAdmin(object):
    list_display = ['id', 'name', 'desc', 'url', 'logo', 'category', 'add_time']
    search_fields = ['id', 'name', 'category', 'url']
    list_filter = ['id', 'name', 'category', 'url']
    list_editable = ['name', 'desc', 'url', 'logo']
    model_icon = 'fa fa-address-book-o'
    relfield_style = 'fk-ajax'


xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Website, WebsiteAdmin)

xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)
