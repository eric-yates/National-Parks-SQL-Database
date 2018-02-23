# sql-national-parks

This repository contains the layout of a SQL database to manage which national parks, national forests, etc. have been visited. It may be integrated with a GIS system to create a map of parks. Use the x/y coordinate columns to set the location, and use the the visited column to set the color of the pin (ie. red if visited=1 - have visited, blue if visited=0 - have not visited).

Files:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;csv_cleaner.py: Cleans the 'national_forests.csv' file into a workable format. Use before setting up the SQL database.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setup.sql: Creates the database and imports data from the /tmp folder.

Schema - Table: Fields

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parks: park_id (primary key), x-cooordinate, y-coordinate, park_name, state_abbr, park_type, visited  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;States: state_id (primary key), name, abbreviation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trails: trail_id (primary key), park_id, trail_name, distance, elevation, duration, rating, visited  
