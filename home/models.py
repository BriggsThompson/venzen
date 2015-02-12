from django.db import models


class Category(models.Model):
    categoryId = models.IntegerField(primary_key=True)
    first = models.CharField(max_length=100)
    second = models.CharField(max_length=100)
    third = models.CharField(max_length=100)