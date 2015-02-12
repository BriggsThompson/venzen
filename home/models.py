from django.db import models


class Category(models.Model):
    categoryId = models.IntegerField(primary_key=True)
    first = models.CharField(max_length=100)
    second = models.CharField(max_length=100)
    third = models.CharField(max_length=100)
    
    
class ProductDisplay(models.Model):
    productId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=500)
    brand = models.CharField(max_length=100)
    first = models.CharField(max_length=100)
    second = models.CharField(max_length=100)
    retailPrice = models.DecimalField(max_digits=6, decimal_places=2)
    currentPrice = models.DecimalField(max_digits=6, decimal_places=2)
    description = models.CharField(max_length=50)
    image = models.CharField(max_length=500)


class Brand(models.Model):
    brandId = models.IntegerField(primary_key=True)
    brand = models.CharField(max_length=200)
    logo = models.CharField(max_length=1000)
