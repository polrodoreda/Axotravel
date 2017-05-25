# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.contrib.gis.db import models

class Airport(models.Model):
    airport_name = models.CharField(max_length=200)
    airport_iata = models.CharField(max_length=200)
    city_name = models.CharField(max_length=200)
    city_location = models.PointField()
    country_name = models.CharField(max_length=200)
