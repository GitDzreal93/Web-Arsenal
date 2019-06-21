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


class IndexView(View):
    def get(self, request):
        return render(request, "index.html")


class AboutView(View):
    def get(self, request):
        return render(request, "about.html")
