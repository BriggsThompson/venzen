from django.conf.urls import patterns, include, url
from home.views import index, search, category, brand
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = patterns('',
                       url(r'^$', index, name='index'),
                       url(r'^category/(?P<first>[-\w\d\+]+)/(?P<second>[-\w\d\+]+)', category, name='second-category'),
                       url(r'^category/(?P<first>[-\w\d\+]+)', category, name='first-category'),
                       url(r'^brand/(?P<brand>[-\w\d\+]+)', brand, name='brand'),
                       url(r'^search/$', search, name='search'), ) \
              + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)