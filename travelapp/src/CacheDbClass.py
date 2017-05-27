import pprint
from pymongo import MongoClient
import datetime
from pprint import pprint as prinT

class CacheDb:
    def __init__(self):
        self._mongo_client = MongoClient('localhost', 27017)
        self._db = self._mongo_client.local
        self._flight_cache = self._db.flight_cache
        self._api_cache = self._db.api_cache

    def QueryFlightCollection(self, queries):
        results = []
        for query in queries:
            results.append(self._flight_cache.find_one(query))
        return results

    def QueryApiCollection(self, query):
        result = self._api_cache.find_one(query)
        return result

    def CreateFlightCollectionQueries(self, combinations, dates):
        queries = []
        for index, combination in enumerate(combinations):
            for index, city in enumerate(combination[:-1]):
                query = {'origin': combination[index], 'destination': combination[index+1], 'date': dates[index+1]}
                queries.append(query)
        return queries

    def Api2Flight(self, flight_object, flight_object_id):
        post = {'origin': flight_object['flight']['trips']['data']['city'][0]['code'],
                'destination':flight_object['flight']['trips']['data']['city'][-1]['code'],
                'departure_date': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][0]['departureTime'],
                'arrival_date': flight_object['flight']['trips']['tripOption'][0]['slice'][0]['segment'][0]['leg'][-1]['arrivalTime'],
                'flight_id': flight_object_id,
                'query_date': flight_object['date'],
                'price': flight_object['flight']['trips']['tripOption'][0]['saleTotal']
                }
        return post

    def Flight2ApiObjectId(self,flight_object):
        return flight_object['flight_id']

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
