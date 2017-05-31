#-*- coding: utf-8 -*-

import psycopg2


def get_dist(city, city2):
    conn = psycopg2.connect("dbname=axotravel user=postgres password=Pepe1234")
    cur = conn.cursor()
    cur.execute("SELECT st_distance_sphere(a.city_location, b.city_location) FROM travelapp_airport a, travelapp_airport b WHERE a.city_name=%s AND b.city_name=%s;", (city, city2))
    res = cur.fetchone()[0]

    return res/1000


def distance_trip(combinations):
    results = {}

    for index, combination in enumerate(combinations):
        dist = 0
        for i, city in enumerate(combination[:-1]):
            dist += get_dist(city, combination[i+1])
        results[index] = dist

    return combinations[min(results, key = results.get)]


def get_distances(combination):
    distances = []

    for i, city in enumerate(combination[:-1]):
        dist = get_dist(city, combination[i+1])
        distances.append(float("{0:.2f}".format(dist)))

    return distances
