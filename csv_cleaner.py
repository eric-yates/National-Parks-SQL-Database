import re
import pandas as pd

"""
To use this file, first set 'cd' on line  to the path to the
'/sql-national-parks/data' directory. Then, run the script.

The 'national_forests.csv' file is a bit messy. The 'Location' column
contains the state name and two types of GPS coordinates. This script
finds the state name(s) and puts that in a new column 'State'. It also
deletes the first set of GPS coordinates and keeps the second set of
form a.b degN c.d degW in the 'Location' column.

The cleaned file 'national_forests_cleaned.csv' gets saved to the
'/sql-national-parks/data' directory. After cleaning, it may be
inserted correctly into the SQL database.
"""

cd = #your_path_to_data_directory


def load_file(cd):

    file_name = 'national_forests.csv'

    return pd.read_csv(cd + file_name)


def split(df):

    # Create a blank column for state names to go into
    df.loc[:, 'State'] = ''

    # Split the 'Location' column into states and GPS coordinates
    for i, line in enumerate(df['Location'].values):
        digit_marker = re.search('\d', line)
        m = digit_marker.start()

        df.at[i, 'State'] = line[:m-1]

        slash_marker = line.find('/')

        df.at[i, 'Location'] = line[slash_marker+1:]

    return df


def save_file(cd, df):

    save_file = 'national_forests_cleaned.csv'

    df.to_csv(cd + save_file, sep=',')


if __name__ == '__main__':

    df = load_file(cd)

    df = split(df)

    save_file(cd, df)
