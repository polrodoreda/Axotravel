# -*- coding: utf-8 -*-

import pprint
from pymongo import MongoClient
import datetime
from pprint import pprint as prinT
import datetime
import travelapp.src.generic as g
from travelapp.src.QpxApiClass import QpxApi

class CacheDb:
    def __init__(self):
        self._mongo_client = MongoClient('localhost', 27017)
        self._db = self._mongo_client.local
        self._flight_cache = self._db.flight_cache
        self._api_cache = self._db.api_cache
        self._qpx = QpxApi()

    def QueryFlightCollection(self, queries):
        results = []
        for query in queries:
            print query
            results.append(self._flight_cache.find_one(query))
        return results

    def QueryApiCollection(self, query):
        result = self._api_cache.find_one(query)
        return result

    def CreateFlightCollectionQueries(self, combinations, dates):
        queries = []
        for index, combination in enumerate(combinations):
            for index, city in enumerate(combination[:-1]):
                date_origin = datetime.datetime.strptime(dates[index+1], '%Y-%m-%d')
                date_plus_one = date_origin + datetime.timedelta(days=1)
                query = {'origin': combination[index].upper(),
                         'destination': combination[index+1].upper(),
                         'departure_date': {'$gte': str(date_origin), '$lt': str(date_plus_one)}
                         }
                queries.append(query)
        return queries

    def Api2Flight(self, flight_object, flight_object_id):
        post = {'origin': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][0]['origin'],
                'destination': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][-1]['leg'][-1]['destination'],
                'departure_date': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][0]['departureTime'],
                'arrival_date': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][-1]['leg'][-1]['arrivalTime'],
                'flight_id': flight_object_id,
                'query_date': flight_object['date'],
                'price': flight_object['flight']['trips']['tripOption'][0]['saleTotal']
                }
        return post

    def Flight2ApiObjectId(self,flight_object):
        return {'_id':flight_object['flight_id']}

    def Save(self,qpx_json_object):
        if qpx_json_object != None:
            post = {"flight": qpx_json_object,
            "tags": ["qpx"],
            "date": datetime.datetime.utcnow()
            }
            post_id = self._api_cache.insert_one(post).inserted_id
            prinT(post)
            print post_id
            flight_object = self.Api2Flight(post, post_id)
            self._flight_cache.insert_one(flight_object)

    def GetPrices(self, combination, dates):
        for index,city in enumerate(combination):
            combination[index]= g.getIATAFromCityName(city)
        queries = self.CreateFlightCollectionQueries([combination], dates)
        resultsFlightDb = self.QueryFlightCollection(queries)
        prices = []
        prices.append("0")
        for index, resultFlightDb in enumerate(resultsFlightDb):
            prices.append(resultFlightDb['price'].replace("EUR",""))
        return prices

    def Query( self, combinations, dates):
        results = []
        queriesApi = []
        for index,combination in enumerate(combinations):
            for index2,city in enumerate(combination):  
                combinations[index][index2]= g.getIATAFromCityName(city)
        queries = self.CreateFlightCollectionQueries(combinations, dates)
        resultsFlightDb = self.QueryFlightCollection(queries)
        for index,resultFlightDb in enumerate(resultsFlightDb):
            if resultFlightDb != None:
                resultApiDb = self.QueryApiCollection(self.Flight2ApiObjectId(resultFlightDb))
                if resultApiDb != None:
                        results.append(resultApiDb)
            else:
                queriesApi.append(self._qpx.CreateQuery(queries[index]))
        resultsApi = self._qpx.Query(queriesApi)

        for index, resultApi in enumerate(resultsApi):
            prinT(resultApi)
            if 'error' not in resultApi:
                results.append({'flight': resultApi})
                self.Save(resultApi)
            else:
                print(resultApi['error']['message'])
        return results
