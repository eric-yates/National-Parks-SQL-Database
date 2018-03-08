# sql-national-parks

Creates a SQL database to track which national parks, national monuments, national forests,...have been visited. Also tracks which trails have been hiked and their stats. It may be integrated with GIS to create a map of parks.

## Getting Started

These instructions will get a copy of the project up and running on your local machine.

### Prerequisites

What things you need to install the software and how to install them:

```
Python 2.7
PostgreSQL (or any other SQL database)
```

The following may be helpful:

```
PgAdmin4
```

### Installing

Download PostgreSQL [here](https://www.postgresql.org/download/). Or use any other SQL database of your choice.

If you want to play around with the 'csv_cleaner.py' file, you'll need to download Python 2.7 [here](https://www.python.org/downloads/). This script creates cleaned data from a CSV file of national forest data. The cleaned data is already in the /data directory, so there's really no need to run this file if you only want to setup the database.

If you choose to play around with the cleaning file, you'll need pandas. By default, Python should come with pip (a package manager). Use it to install the pandas by opening the Terminal and entering the command:

```
pip install pandas
```

### Database Setup

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) Clone/fork the repository  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) Copy the 'data' folder to /tmp  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) Create a database in your SQL environment of choice  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4) Run 'setup.sql' in your database  


## Usage

### Files

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;csv_cleaner.py: Cleans up 'national_forests.csv'. Cleaned file already in /data, so unnecessary to run  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;setup.sql: Creates the database and imports data from the /tmp folder  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;insert_data.sql: Contains examples for how to insert new data into the database  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;example_queries.sql: Contains examples for how to query the data  

### Schema - Table: Fields

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Parks: park_id (primary key), x-cooordinate, y-coordinate, park_name, state_abbr, park_type, visited  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;States: state_id (primary key), name, abbreviation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Trails: trail_id (primary key), park_id, trail_name, distance, elevation, duration, rating, visited, visit_date  

### Data Sources

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_forests.csv: Uncleaned data related to national forests only  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_forests_cleaned.csv: Cleaned data obtained from passing it to the csv_cleaner.py file  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;national_parks.csv: Data related to national parks, national monuments,...  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;states.csv: Contains a table of state-abbreviation pairs  

### GIS Integration

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) Use the x/y coordinate columns to set the location
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) Use the the visited column to set the color of the pin 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a) ie. Red if visited = 1 - have visited
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b) ie. Blue if visited=null - have not visited).


## Built With

* [PostgreSQL](https://www.postgresql.org/about/) - Open-source, object-relational database
* [PgAdmin4](https://www.pgadmin.org/) - Administration and development platform for PostgreSQL
* [Pandas](https://pandas.pydata.org/pandas-docs/stable/) - Data manipulation


## Authors

* **Eric Yates** - [Github Profile](https://github.com/eric-yates)


## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/eric-yates/job-scraper/blob/master/LICENSE.md) file for details


## Acknowledgments

* To the friends and the travels we've enjoyed, thank you for the inspiration for this project
