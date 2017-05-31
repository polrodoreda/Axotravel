#-*- coding:utf-8 -*-

import itertools
import datetime
import psycopg2

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

def getCityNameFromIATA(iata):
    conn = psycopg2.connect("dbname=axotravel user=postgres password=Pepe1234 host=172.31.32.50")
    cur = conn.cursor()
    cur.execute("SELECT city_name FROM travelapp_airport WHERE airport_iata='"+iata.upper()+"';")
    res = cur.fetchone()[0]
    return res

def getIATAFromCityName(city):
    conn = psycopg2.connect("dbname=axotravel user=postgres password=Pepe1234 host=172.31.32.50")
    cur = conn.cursor()
    cur.execute("SELECT airport_iata FROM travelapp_airport WHERE upper(city_name)='"+city.upper()+"';")
    res = cur.fetchone()[0]
    return res


def MinPrice(combinations, flights):
    results = {}
    for index, combination in enumerate(combinations):
        price = 0
        for i, city in enumerate(combination[:-1]):

            for flight in flights:
                #print (str(flight['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][0]['origin']).upper()+city.upper() + ">" +
                #str(flight['flight']['trips']['tripOption'][0]['slice'][0]['segment'][-1]['leg'][-1]['destination']).upper()+combination[i+1].upper())
                if (str(flight['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][0]['origin']).upper()==city.upper()
                and str(flight['flight']['trips']['tripOption'][0]['slice'][0]['segment'][-1]['leg'][-1]['destination']).upper()==combination[i+1].upper()):
                    value = float(flight['flight']['trips']['tripOption'][0]['saleTotal'].replace("EUR",""))
                    #print (city.upper() + ">"+ combination[i+1].upper() +":" +flight['flight']['trips']['tripOption'][0]['saleTotal'])
                    #value = float(flight['flight']['trips']['tripOption'][0]['saleTotal'].replace("$",""))
                    price += value
        results[index] = price
    #print(combinations)
    #prinT(results)
    return combinations[min(results, key=results.get)]
