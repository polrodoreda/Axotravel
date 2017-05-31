# -*- coding: utf-8 -*-

import json
import requests
from pprint import pprint as prinT
from datetime import datetime
import itertools
import copy
import psycopg2

class QpxApi:
    #db.getCollection('flight_cache').find({'flight.trips.data.city.code':"BCN"})
    api_key = "AIzaSyC_G4LIPXB6YbBmW6-1qHQ4cJk-AmWw4ek"
    url = "https://www.googleapis.com/qpxExpress/v1/trips/search?key=" + api_key
    headers = {'content-type': 'application/json'}
    _fileData = ""


    def __init__(self):
        pass

    def CreateQuery(self, flightDbQuery):
        params ={
          "request": {
            "slice": [
            ],
            "passengers": {
              "adultCount": 1,
              "infantInLapCount": 0,
              "infantInSeatCount": 0,
              "childCount": 0,
              "seniorCount": 0
            },
            "solutions": 1,
            "refundable": False
          }
        }

        query = copy.deepcopy(params)
        query["request"]["slice"].append({
        "origin": flightDbQuery['origin'].upper(),
        "destination": flightDbQuery['destination'].upper(),
        "date": datetime.strptime(flightDbQuery['departure_date']['$gte'], '%Y-%m-%d %H:%M:%S').strftime('%Y-%m-%d')
        })

        return query

    def Query(self, queries):
        results = []
        for index, query in enumerate(queries):
            #data = None
            prinT(json.dumps(query))
            print("")
            print("")
            #######################################################################################
            # Cuidado que me cobran!!!!!!!!!!!!
            response = requests.post(self.url, data=json.dumps(query), headers=self.headers)
            data = response.json()
            results.append(data)
            #######################################################################################
            #results.append(None)
        return results
