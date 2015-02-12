from home.models import Category, Brand

__author__ = 'briggs'


def build_categories():
    categories = [category for category in Category.objects.raw('SELECT * FROM category')]
    category_dict = {}
    for category in categories:
        if category.first not in category_dict:
            category_dict[category.first] = {
                'categoryId': category.categoryId,
                'children': [],
                'link': '/category/{0}/'.format(category.first.lower().replace(' ', '-'))
            }
        else:
            category_dict[category.first]['children'].append(
                {
                    'categoryId': category.categoryId,
                    'value': category.second,
                    'link': '/category/{0}/{1}/'.format(
                        category.first.lower().replace(' ', '-'),
                        category.second.lower().replace(' ', '-'))
                }
            )

    return [
        {
            'category': key, 
            'value': category_dict[key],
            'link': category_dict[key]['link']
        }
        for key in sorted(category_dict, key=lambda k: category_dict[k]['categoryId'])
    ]


def build_brands():
    brands = [brand for brand in Brand.objects.raw('SELECT * FROM brand where verified = 1')]
    return [
        {
            'brand': brand.brand,
            'link': '/brand/{0}/'.format(brand.brand.lower().replace(' ', '-'))
        } for brand in sorted(brands, key=lambda x: x.brand)
    ]