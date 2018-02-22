import json

from jsonschema import validate
from pprint import pprint

"""
Sources:

Loading JSON File:
https://stackoverflow.com/questions/20199126/reading-json-from-a-file

Validate JSON File:
http://code.activestate.com/recipes/579135-validate-data-easily-with-json-schema/
https://pypi.python.org/pypi/jsonschema

"""

cd = '/Users/ericyates/Desktop/GIS_Data/sql_data/Takeout/Location_History/'

with open(cd + 'Location-History.json') as json_data:
    decoded = json.load(json_data)

    print decoded
