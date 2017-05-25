from django.conf.urls import url
from . import views


urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^travel/form/$', views.travel_form, name='travel_form'),
    url(r'^travel/info/$', views.travel_info, name='travel_info'),
]
