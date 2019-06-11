from django.shortcuts import render
from django.http import FileResponse,Http404
from django.shortcuts import render
from rest_framework import viewsets, status,filters, pagination
from rest_framework.response import Response
from collections import OrderedDict, namedtuple
from rest_framework.renderers import TemplateHTMLRenderer
from django.views.generic.base import View
from django_filters.rest_framework import DjangoFilterBackend
from random import choice

from .models import Category,Website
from .serializer import CategorySerializer,WebsiteSerializer


# Create your views here.
class CategoryViewset(viewsets.ModelViewSet):
    '''
    网站分类 API
    '''
    queryset = Category.objects.filter(is_show=True)
    serializer_class = CategorySerializer
    ordering_fields = ('weight')


class WebsiteViewset(viewsets.ModelViewSet):
    '''
    网站列表 API
    '''
    queryset = Website.objects.filter(category__is_show=True)
    serializer_class = WebsiteSerializer

class IndexView(View):
    def get(self, request):
        return render(request, "index.html")

class AboutView(View):
    def get(self, request):
        return render(request, "about.html")