# -*- coding: UTF-8 -*-
"""
获取飘花电影网https://www.piaohua.com/列表

"""


import requests
from bs4 import BeautifulSoup
from datetime import datetime, timedelta

def get_review(page_url):
	movies_list=[]
	response=requests.get(page_url) 
	soup=BeautifulSoup(response.text,"lxml") #获取页面lxml解析
	soup=soup.find('div','bunews')
	print(soup)
	for tag_li in soup.find_all('li'):
		dict={}
		dict['tim']=tag_li.find('span').string 
		dict['name']=tag_li.find('font').string 
		movies_list.append(dict)
	return movies_list



if __name__ == "__main__":
	url="https://www.piaohua.com/html/zuixindianying.html"
	movies_list=get_review(url)
	for movie_dict in movies_list:
		print('电影名称：'+movie_dict.get('name'))
		print('发布时间：'+movie_dict['tim'])
		print('-------------------------------------')



"""
	for movie_dict in movies_list:
		print('电影名：'+movie_dict.get('Name'))
		print('时间：'+movie_dict.get('Time'))
		print('------------------------------------------------------')
"""
