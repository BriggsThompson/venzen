"""
WSGI config for venzen project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/howto/deployment/wsgi/
"""

import os, site, sys
from django.core.wsgi import get_wsgi_application
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "venzen.settings-prod")

SITE_DIR = '/home/ubuntu/web/venzen.com/venzen/'
APP_DIR = '/home/ubuntu/web/venzen.com/venzen/venzen/'
site.addsitedir(SITE_DIR)
sys.path.append(SITE_DIR)
sys.path.append(APP_DIR)

os.environ['DJANGO_SETTINGS_MODULE'] = 'venzen.settings-prod'
#application = django.core.handlers.wsgi.WSGIHandler()
application = get_wsgi_application()
