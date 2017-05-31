from django.conf.urls import url
from django.views.generic import TemplateView
from . import views


urlpatterns = [
    url(r'^$', views.home, name='home'),
    url(r'^travel/form/$', views.travel_form, name='travel_form'),
    url(r'^travel/info/$', views.travel_info, name='travel_info'),
    url(r'^help/$', TemplateView.as_view(template_name='help.html'), name='help'),
]
