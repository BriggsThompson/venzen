"""
Django settings for venzen project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os, sys

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


SITE_DIR = '/home/ubuntu/web/venzen.com/venzen/'
APP_DIR = '/home/ubuntu/web/venzen.com/venzen/venzen/'
sys.path.append(SITE_DIR)
sys.path.append(APP_DIR)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '9di%dma$^5c!+sr*h=0a3tx!d(38^n3tivb7&x&^gqb+527by='

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

TEMPLATE_DEBUG = False

ALLOWED_HOSTS = ['54.153.13.143']

DOMAIN_NAME = '54.153.13.143'
#CSRF_COOKIE_NAME = 'venzen_csrf'
#CSRF_COOKIE_SECURE = True
#SESSION_COOKIE_SECURE = True
#CSRF_COOKIE_DOMAIN = DOMAIN_NAME
#CONN_MAX_AGE = 10000
# Application definition

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_admin_bootstrapped',
    'django.contrib.admin',
    'django.contrib.admindocs',
    's3direct',
    'home'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware'

)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.messages.context_processors.messages',
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.csrf'
)

ROOT_URLCONF = 'venzen.urls'

WSGI_APPLICATION = 'venzen.wsgi.application'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'venzen',
        'USER': 'root',
        'PASSWORD': 'venzenson',
        'HOST': '127.0.0.1',
        'PORT': '3306'
    }
}
        # Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, "static"),
)

STATIC_ROOT = '/var/www/venzen/static'

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, "templates"),)

DEFAULT_FILE_STORAGE = 'storages.backends.s3.S3Storage'

S3DIRECT_REGION = 'us-west-1'

AWS_ACCESS_KEY_ID = 'AKIAJJE6EE7SWXKQMBYQ'
AWS_SECRET_ACCESS_KEY = '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'
AWS_STORAGE_BUCKET_NAME = 'venzen-images'
IMAGE_SPACE_S3_PATH = 'production/space/images'


def create_filename(filename):
    import uuid
    ext = filename.split('.')[-1]
    filename = '%s.%s' % (uuid.uuid4().hex, ext)
    return os.path.join(IMAGE_SPACE_S3_PATH, filename)

S3DIRECT_DESTINATIONS = {
    'space_images': (create_filename, lambda u: u.is_staff, ['image/jpeg', 'image/png'],),
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
        },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': '/var/log/venzen/venzen.debug.log',
            'formatter': 'verbose'
        },
        },
    'loggers': {
        'django': {
            'handlers':['file'],
            'propagate': True,
            'level':'DEBUG',
            },
        'MYAPP': {
            'handlers': ['file'],
            'level': 'DEBUG',
            },
        }
}