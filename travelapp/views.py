# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.shortcuts import render
import travelapp.src.generic as g
import travelapp.src.weather as w
import travelapp.src.distance as d
from pymongo import MongoClient
from datetime import datetime
import GeoIP

def home(request):
    ip =  request.META['REMOTE_ADDR']
    gi = GeoIP.open("/Volumes/Data/Users/polrodoreda/Documents/Master/Q2/CC/AxoTravel/travelapp/geoip/GeoLiteCity.dat", GeoIP.GEOIP_STANDARD)
    gir = gi.record_by_addr(ip)
    if gir is not None:
        city = gir['city']
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
    db = client.travelappnosql
    pipe = [{'$group': {'_id': "$name", 'qty': {'$sum': "$qty"}}}, {'$sort': {'qty': -1}}, {'$limit': 4}]
    for x in db.cities.aggregate(pipeline=pipe):
        destinations.append(x['_id'])
    return render(request, 'travelapp/travel_form.html', {'destinations': destinations})


def travel_info(request):
    if request.GET:
        cities = [request.GET['origin'], request.GET['city1'], request.GET['city2']]
        clear_cities = g.correct_cities(cities)
        depart_date = str(request.GET['date'])

        if request.GET['filter'] == 'Price':
            pass

        elif request.GET['filter'] == 'Weather':
            if (datetime.strptime(request.GET['date'], "%Y-%m-%d") - datetime.now()).days < 7:
                owm = w.api_connection()
                dates = g.get_dates(depart_date, clear_cities)
                combinations = g.get_combinations(clear_cities)
                result = w.weather_trip(combinations, dates, owm)
                weather = w.get_weather(result, dates, owm)
                data = zip(result, dates, weather)
            else:
                return render(request, 'travelapp/travel_error.html', {})

        else:
            dates = g.get_dates(depart_date, clear_cities)
            combinations = g.get_combinations(clear_cities)
            result = d.distance_trip(combinations)
            weather = [1, 2, 3, 4]
            data = zip(result, dates, weather)

    else:
        data = 'Error'
    return render(request, 'travelapp/travel_info.html', {'data': data})
