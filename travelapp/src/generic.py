#-*- coding:utf-8 -*-

import itertools
import datetime

def get_dates(depart_date, cities):
    date = datetime.datetime.strptime(depart_date, '%Y-%m-%d')
    dates = [depart_date, depart_date]

    for i in range(2, len(cities) * 2, 2):
        dates.append(str(date + datetime.timedelta(days = i))[:10])

    return dates


def correct_cities(cities):
    clear = []
    for city in cities:
        clear.append(city.lower().capitalize())

    return clear


def get_combinations(cities):
    combinations = []
    origin = [cities[0]]

    for comb in list(itertools.permutations(cities[1:], len(cities) - 1)):
        combinations.append(origin + list(comb) + origin)

    return combinations
