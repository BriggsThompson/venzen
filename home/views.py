from django.shortcuts import render_to_response
from django.template import RequestContext
from home.models import Category


def index(request):

    categories = [category for category in Category.objects.raw('SELECT * FROM category limit 5')]

    return render_to_response("index.html", {
        'contents': [1, 2, 3, 4],
        'categories': categories
        }, context_instance=RequestContext(request))
