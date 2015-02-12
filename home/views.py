from django.shortcuts import render_to_response
from django.template import RequestContext
from home.helpers import build_categories, build_brands
from home.models import Category
from django.conf import settings
import solr

    
def index(request):

    solr_instance = solr.SolrConnection(settings.PRODUCT_SOLR_URL)
    products = solr_instance.select('second:shafts', sort='cashOff', sort_order='desc', facet='true',
                             facet_field='brand_string', rows=35, fq="-image:None")

    return render_to_response("index.html", {
        'categories': build_categories(),
        'brands': build_brands(),
        'products': products
        }, context_instance=RequestContext(request))


def search(request):

    if ('q' in request.GET) and request.GET['q'].strip():
        q = request.GET['q'].strip()
        solr_instance = solr.SolrConnection(settings.PRODUCT_SOLR_URL)
        query_fields = [
            "description^1.0",
            "name^3.0",
            "brand^3.0",
            "first^3.0",
            "second^3.0"
        ]
        
        products = solr_instance.select(
            q,
            facet='true', facet_field='brand_string', 
            rows=35, fq="-image:None",
            defType='edismax', qf=' '.join(query_fields)
        )

        return render_to_response("search.html", {
            'categories': build_categories(),
            'products': products,
            'brands': build_brands(),
            'search_query': q,
            'result_count': products.numFound
        }, context_instance=RequestContext(request))


def category(request, first, second=None):

    solr_instance = solr.SolrConnection(settings.PRODUCT_SOLR_URL)
    
    fq = None
    if first and not second:
        fq = 'first:"{0}"'.format(first.replace('-', ' '))
    elif first and second:
        fq = 'first:"{0}" AND second:"{1}"'\
            .format(first.replace('+', ' '), second.replace('-', ' '))

    products = solr_instance.select(
        '*:*',
        facet='true', facet_field='brand_string',
        rows=35, sort='percentOff', sort_order='desc',
        fq=["-image:None", fq]

    )
    
    first_category = {
        'category': ' '.join([cat.capitalize() for cat in first.split('-')]),
        'link': '/category/{0}'.format(first)
    }
    
    second_category = None
    if second:
        second_category = {
            'category': ' '.join([cat.capitalize() for cat in second.split('-')]),
            'link': '/category/{0}/{1}'.format(first, second)
        }
    
    return render_to_response("category.html", {
        'categories': build_categories(),
        'products': products,
        'brands': build_brands(),
        'result_count': products.numFound,
        'first': first_category,
        'second': second_category,
    }, context_instance=RequestContext(request))


def brand(request, brand):

    solr_instance = solr.SolrConnection(settings.PRODUCT_SOLR_URL)

    fq = 'brand:"{0}"'.format(brand.replace('-', ' '))

    products = solr_instance.select(
        '*:*',
        facet='true', facet_field='brand_string',
        rows=35, sort='percentOff', sort_order='desc',
        fq=["-image:None", fq]

    )

    return render_to_response("brand.html", {
        'categories': build_categories(),
        'products': products,
        'brands': build_brands(),
        'brand': ' '.join([word.capitalize() for word in brand.split('-')]),
        'result_count': products.numFound
    }, context_instance=RequestContext(request))