# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.shortcuts import render
import travelapp.src.generic as g
import travelapp.src.weather as w
import travelapp.src.distance as d
from pymongo import MongoClient
import datetime
from django.contrib.gis.geoip import GeoIP
from travelapp.src.CacheDbClass import CacheDb
from pprint import pprint as prinT
import copy

def home(request):
    ip =  request.META['REMOTE_ADDR']
    g = GeoIP()
    if ip is not None:
        city = g.city(ip)
        if city is None:
            city = 'Barcelona'
    else:
        city = 'Barcelona'
    owm = w.api_connection()
    obs = owm.weather_at_place(city)
    we = obs.get_weather()
    temperature = we.get_temperature(unit='celsius')['temp']
    status = we.get_status()
    return render(request, 'travelapp/home.html', {'city': city, 'temperature': temperature, 'status': status})


def travel_form(request):
    destinations = []
    client = MongoClient()
    db = client.local
    pipe = [{'$group': {'_id': "$destination", 'destination': {'$sum': 1}}}, {'$sort': {'destination': -1}}, {'$limit': 4}]
    for x in db.flight_cache.aggregate(pipeline=pipe):
        destinations.append(x['_id'])

    for iata in destinations:
        destinations2.append(g.getCityNameFromIATA(iata))
    return render(request, 'travelapp/travel_form.html', {'destinations': destinations})


def travel_info(request):
    if request.GET:
        cities = [request.GET['origin'], request.GET['city1'], request.GET['city2']]
        clear_cities = g.correct_cities(cities)
        depart_date = str(request.GET['date'])
        dates = g.get_dates(depart_date, clear_cities)
        combinations = g.get_combinations(clear_cities)
        owm = w.api_connection()
        cdb = CacheDb()

        if request.GET['filter'] == 'Price':
            results = cdb.Query(combinations, dates)
            result = g.MinPrice(combinations, results)
            #convert iata to city name
            for index, iata in enumerate(result):
                result[index] = g.getCityNameFromIATA(iata)

        elif request.GET['filter'] == 'Weather':
            if (datetime.datetime.strptime(request.GET['date'], "%Y-%m-%d") - datetime.datetime.now()).days < 5:
                result = w.weather_trip(combinations, dates, owm)
            else:
                return render(request, 'travelapp/travel_error.html', {})

        elif request.GET['filter'] == 'Distance':
            result = d.distance_trip(combinations)

        # Travel Info
        price = cdb.GetPrices(copy.deepcopy(result), dates)
        if (datetime.datetime.strptime(request.GET['date'], "%Y-%m-%d") - datetime.datetime.now()).days < 5:
            weather = w.get_weather(result, dates, owm)
        else:
            weather = ['Not available', 'Not available', 'Not available', 'Not available']
        distance = [0] + d.get_distances(result)
        data = zip(result, dates, weather, price, distance)
        total_price = 0
        for x in price:
            total_price += float(x)

    else:
        data = 'Error'
        return render(request, 'travelapp/info_error.html', {})
    return render(request, 'travelapp/travel_info.html', {'data': data, 'total_price': total_price})
