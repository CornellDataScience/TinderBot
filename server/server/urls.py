"""server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from tinderbot import views


router = routers.DefaultRouter()
#router.register(r'tinderbot', views.TinderBotView, 'tinderbot')
#router.register(r'username', views.TinderBotView.as_view({'post':'hellodjango'}), 'username')

urlpatterns = [
    #path('login/', views.getOTP_SMS),
    #path('admin/', admin.site.urls),
    #path('api/', include(router.urls)),
    path('login/get_sms', views.LoginApiView.as_view({'post': 'get_sms'})),
    path('login/get_login', views.LoginApiView.as_view({'get': 'get_token'})),
]