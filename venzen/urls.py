from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from home.views import index, listings, venue_page, space_page

from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^admin/s3direct/', include('s3direct.urls')),
    url(r'^listings/', listings, name='listings'),
    url(r'^venue/', venue_page, name='venue_page'),
    url(r'^space/', space_page, name='space_page'),
    url(r'^$', index, name='index'), ) \
              + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)