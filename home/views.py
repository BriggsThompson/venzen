from django.shortcuts import render_to_response
from django.template import RequestContext

    
def index(request):

    return render_to_response("index.html", {
        'test': [1,2,3]
        }, context_instance=RequestContext(request))