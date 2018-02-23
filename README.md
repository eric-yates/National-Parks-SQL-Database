# sql-national-parks

This repository contains the layout of a SQL database to manage which national parks, national forests, etc. have been visited. It may be integrated with a GIS system to create a map of parks. Use the x/y coordinate columns to set the location, and use the the visited column to set the color of the pin (ie. red if visited=1 - have visited, blue if visited=null - have not visited).

Setup Instructions:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) Clone/fork the repository  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) Copy the 'data' folder to /tmp  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) Create a database in your SQL environment of choice  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) Run 'setup.sql' in your database  

Files:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;csv_cleaner.py: Cleans 'national_forests.csv' into a workable format. Use before setting up the SQL database  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setup.sql: Creates the database and imports data from the /tmp folder  

Schema - Table: Fields

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parks: park_id (primary key), x-cooordinate, y-coordinate, park_name, state_abbr, park_type, visited  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;States: state_id (primary key), name, abbreviation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trails: trail_id (primary key), park_id, trail_name, distance, elevation, duration, rating, visited, date  

Data:

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_forests.csv: Uncleaned data related to national forests only  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_forests_cleaned.csv: Cleaned data obtained from passing it to the csv_cleaner.py file  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_parks.csv: Data related to national parks, national historic parks,...  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;states.csv: Contains a table of state-abbreviation pairs  
