#-*- coding: utf-8 -*-

import psycopg2


def get_dist(city, city2):
    conn = psycopg2.connect("dbname=travelapp_airport user=postgres password=Pepe1234")
    cur = conn.cursor()
    cur.execute("SELECT st_distance_sphere(a.location, b.location) FROM travelapp_airport a, travelapp_airport b WHERE a.name=%s AND b.name=%s;", (city, city2))
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
