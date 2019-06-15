# -*- coding:utf-8 -*-
import json

from rest_framework import serializers
from drf_writable_nested import WritableNestedModelSerializer

from pprint import pprint
from django.db.models import Q
from .models import Category, Website, WebConfig


class WebConfigSerializer(serializers.ModelSerializer):
    class Meta:
        model = WebConfig
        fields = "__all__"


class CategorySerializer(serializers.ModelSerializer):
    web_config = WebConfig()

    class Meta:
        model = Category
        fields = "__all__"


class WebsiteSerializer(serializers.ModelSerializer):
    category = CategorySerializer()

    class Meta:
        model = Website
        fields = "__all__"
