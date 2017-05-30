
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.shortcuts import render
import travelapp.src.generic as g
import travelapp.src.weather as w
import travelapp.src.distance as d
from pymongo import MongoClient
from datetime import datetime
from django.contrib.gis.geoip import GeoIP
from travelapp.src.QpxApiClass import QpxApi
from travelapp.src.CacheDbClass import CacheDb
from pprint import pprint as prinT


def home(request):
    ip =  request.META['REMOTE_ADDR']
    g = GeoIP()
    #gi = GeoIP.open("geoip/GeoLiteCity.dat", GeoIP.GEOIP_STANDARD)
    #gir = gi.record_by_addr(ip)
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
    pipe = [{'$group': {'_id': "$name", 'qty': {'$sum': "$qty"}}}, {'$sort': {'qty': -1}}, {'$limit': 4}]
    for x in db.flight_cache.aggregate(pipeline=pipe):
        destinations.append(x['_id'])
    return render(request, 'travelapp/travel_form.html', {'destinations': destinations})


def travel_info(request):
    if request.GET:
        cities = [request.GET['origin'], request.GET['city1'], request.GET['city2']]
        clear_cities = g.correct_cities(cities)
        depart_date = str(request.GET['date'])

        if request.GET['filter'] == 'Price':
            cdb = CacheDb()
            qpx = QpxApi()
            results = []
            queriesApi = []

            dates = g.get_dates(depart_date, clear_cities)
            combinations = g.get_combinations(clear_cities)
            queries = cdb.CreateFlightCollectionQueries(combinations, dates)
            prinT(queries)
            resultsFlightDb = cdb.QueryFlightCollection(queries)
            prinT(resultsFlightDb)
            for index,resultFlightDb in enumerate(resultsFlightDb):
                if resultFlightDb != None:
                    resultApiDb = cdb.QueryApiCollection({cdb.Flight2ApiObjectId(resultFlightDb)})
                    if resultApiDb != None:
                            results.append(resultApiDb)
                else:
                    queriesApi.append(qpx.CreateQuery(queries[index]))
            resultsApi = qpx.Query(queriesApi)
            for index, resultApi in enumerate(resultsApi):
                prinT(resultApi)
                if 'error' not in resultApi:
                    results.append(resultApi)
                    cdb.Save(resultApi)
                else:
                    print(resultApi['error']['message'])
            minPrice = qpx.MinPrice(results)
            #print result
            #returned_data = api.Query(queryArray)
            result= "pepe"
            data = zip(result, dates, ['', 2, 3, 4])


        elif request.GET['filter'] == 'Weather':
            if (datetime.strptime(request.GET['date'], "%Y-%m-%d") - datetime.now()).days < 7:
                owm = w.api_connection()
                dates = g.get_dates(depart_date, clear_cities)
                combinations = g.get_combinations(clear_cities)
                result = w.weather_trip(combinations, dates, owm)
                prices = ['', 0, 0, 0] #TODO low_price(result)
                weather = w.get_weather(result, dates, owm)
                data = zip(result, dates, weather, prices)
            else:
                return render(request, 'travelapp/travel_error.html', {})

        elif request.GET['filter'] == 'Distance':
            dates = g.get_dates(depart_date, clear_cities)
            combinations = g.get_combinations(clear_cities)
            result = d.distance_trip(combinations)
            weather = ['', '', '', '']
            prices = ['', 0, 0, 0] #TODO
            data = zip(result, dates, weather, prices)

    else:
        data = 'Error'
    return render(request, 'travelapp/travel_info.html', {'data': data})
