#-*- coding: utf-8 -*-

import psycopg2


def get_dist(city_id, city2_id):
    conn = psycopg2.connect("dbname=geodjango user=postgres password=Pepe1234")
    cur = conn.cursor()
    cur.execute("SELECT st_distance_sphere(a.location, b.location) FROM cities_city a, cities_city b WHERE a.id=%s AND b.id=%s;", (city_id, city2_id))
    res = cur.fetchone()[0]

    return res/1000


def distance_trip(combinations):
    results = {}

    for index, combination in enumerate(combinations):
        dist = 0
        for i, city in enumerate(combination[:-1]):
            dist += get_dist(city, combination[i+1])
        results[index] = dist

    return combinations[min(results)]
