from django.conf.urls import patterns, include, url
from home.views import index
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = patterns('', url(r'^$', index, name='index'), ) \
              + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)