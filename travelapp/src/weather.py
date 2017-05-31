#-*- coding:utf-8 -*-

import pyowm

def api_connection():
    API_key = '2def25b867aa6cd780db6b7395054976'
    return pyowm.OWM(API_key)


def weather_trip(combinations, dates, owm):
    weights = {'Clear': 3, 'Clouds': 2, 'Rain': 1}
    results = {}

    for index, combination in enumerate(combinations):
        weight = 0
        for i, city in enumerate(combination):
            fc = owm.daily_forecast(city, limit = 14)
            date = dates[i] + ' 12:00:00+00'
            w = fc.get_weather_at(date)
            weight += weights[str(w.get_status())]
        results[index] = weight
    return combinations[max(results, key = results.get)]


def get_weather(combination, dates, owm):
    result = []

    for i, city in enumerate(combination):
        fc = owm.daily_forecast(city, limit = 14)
        date = dates[i] + ' 12:00:00+00'
        w = fc.get_weather_at(date)
        result.append(str(w.get_status()))

    return result
