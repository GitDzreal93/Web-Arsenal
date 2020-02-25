from django.shortcuts import render
from django.http import FileResponse, Http404
from django.shortcuts import render
from rest_framework import viewsets, status, filters, pagination
from rest_framework.response import Response
from collections import OrderedDict, namedtuple
from rest_framework.renderers import TemplateHTMLRenderer
from django.views.generic.base import View
from django_filters.rest_framework import DjangoFilterBackend
from random import choice

from .models import Category, Website, WebConfig
from .serializer import CategorySerializer, WebsiteSerializer, WebConfigSerializer
from .filters import WebconfigFilter, CategoryFilter, WebsiteFilter


# Create your views here.
class WebConfigViewset(viewsets.ModelViewSet):
    '''
    网站配置
    '''
    queryset = WebConfig.objects.all()
    serializer_class = WebConfigSerializer
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter,)
    filter_class = WebconfigFilter


class CategoryViewset(viewsets.ModelViewSet):
    '''
    网站分类 API
    '''
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter,)
    filter_class = CategoryFilter
    ordering_fields = ('weight',)


class WebsiteViewset(viewsets.ModelViewSet):
    '''
    网站列表 API
    '''
    queryset = Website.objects.all()
    serializer_class = WebsiteSerializer
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter,)
    filter_class = WebsiteFilter


# up主常关注的
class UpIndexView(View):
    def get(self, request):
        return render(request, "index_v4.html")

# 改图工具箱
class PictureIndexView(View):
    def get(self, request):
        return render(request, "index_pic.html")

# 炒股常用网站
class StockIndexView(View):
    def get(self, request):
        return render(request, "index_stock.html")

# 律师常用网站
class LawyerIndexView(View):
    def get(self, request):
        return render(request, "index_lawyer.html")


# 会计常用网站
class AccountingIndexView(View):
    def get(self, request):
        return render(request, "index_accounting.html")

# 学英语常用网站
class EnglishIndexView(View):
    def get(self, request):
        return render(request, "index_english.html")

# 美国留学生常用网站
class USAIndexView(View):
    def get(self, request):
        return render(request, "index_usa.html")

# 澳大利亚留学生常用网站
class AUSIndexView(View):
    def get(self, request):
        return render(request, "index_aus.html")

# 英国留学生常用网站
class UKIndexView(View):
    def get(self, request):
        return render(request, "index_uk.html")

# 加拿大留学生常用网站
class CANIndexView(View):
    def get(self, request):
        return render(request, "index_can.html")

class AboutView(View):
    def get(self, request):
        return render(request, "about.html")
