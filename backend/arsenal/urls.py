# -*- coding:utf-8 -*-
"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from rest_framework.routers import DefaultRouter
from django.contrib import admin
from django.urls import path
from .views import *


router = DefaultRouter()
# api
router.register('api/v1/category', CategoryViewset, base_name="category_api")
router.register('api/v1/website', WebsiteViewset, base_name="website_api")
router.register('api/v1/webconfig', WebConfigViewset, base_name="webconfig_api")

urlpatterns = [
    path('index/', IndexView.as_view(), name='index'),
    path('about/', AboutView.as_view(), name='about')
]

urlpatterns += router.urls