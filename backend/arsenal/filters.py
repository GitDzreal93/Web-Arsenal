# -*- coding:utf-8 -*-
import django_filters
from .models import *


class WebconfigFilter(django_filters.rest_framework.FilterSet):
    """
    网站主页配置过滤
    """
    is_running = django_filters.BooleanFilter(field_name='is_running')

    class Meta:
        model = WebConfig
        fields = ['is_running']


class CategoryFilter(django_filters.rest_framework.FilterSet):
    """
    过滤网站分类信息
    """
    category = django_filters.CharFilter(field_name='category')
    is_running = django_filters.BooleanFilter(field_name='webconfig__is_running')
    cat_is_show = django_filters.BooleanFilter(field_name='is_show')

    class Meta:
        model = Category
        fields = ['cat_is_show']


class WebsiteFilter(django_filters.rest_framework.FilterSet):
    """
    过滤网站信息
    """
    category_id = django_filters.CharFilter(field_name='category__id')
    webconfig_id = django_filters.NumberFilter(field_name='category__webconfig__id')
    is_running = django_filters.BooleanFilter(field_name='category__webconfig__is_running')
    cat_is_show = django_filters.BooleanFilter(field_name='category__cat_is_show')
    ws_is_show = django_filters.BooleanFilter(field_name='ws_is_show')

    class Meta:
        model = Website
        fields = ['is_running', 'cat_is_show', 'ws_is_show','webconfig_id','category_id']
