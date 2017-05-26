# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.shortcuts import render
import travelapp.src.generic as g
import travelapp.src.weather as w
import travelapp.src.distance as d


def home(request):
    # geoip
    city = 'Barcelona'
    owm = w.api_connection()
    obs = owm.weather_at_place(city)
    we = obs.get_weather()
    temperature = we.get_temperature(unit='celsius')['temp']
    status = we.get_status()
    return render(request, 'travelapp/home.html', {'city': city, 'temperature': temperature, 'status': status})


def travel_form(request):
    # Data mining to search hot destinations
    destinations = ['Barcelona', 'Dublin', 'Berlin', 'Lisbon']
    return render(request, 'travelapp/travel_form.html', {'destinations': destinations})


def travel_info(request):
    if request.GET:
        cities = [request.GET['origin'], request.GET['city1'], request.GET['city2']]
        clear_cities = g.correct_cities(cities)
        depart_date = str(request.GET['date'])

        if request.GET['filter'] == 'Price':
            pass

        elif request.GET['filter'] == 'Weather':
            owm = w.api_connection()
            dates = g.get_dates(depart_date, clear_cities)
            combinations = g.get_combinations(clear_cities)
            result = w.weather_trip(combinations, dates, owm)
            weather = w.get_weather(result, dates, owm)
            data = zip(result, dates, weather)

        else:
            dates = g.get_dates(depart_date, clear_cities)
            combinations = g.get_combinations(clear_cities)
            result = d.distance_trip(combinations)
            data = zip(result, dates)

    else:
        data = 'Error'
    return render(request, 'travelapp/travel_info.html', {'data': data})
