# -*- coding:utf-8 -*-
from random import choice
from .models import Category


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

if __name__ == '__main__':
    sn = generate_sn()
    print(sn)