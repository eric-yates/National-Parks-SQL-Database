import re
import pandas as pd

"""
The 'national_forests.csv' file is a bit messy. This file cleans the
CSV file so that it may be inserted into the SQL database.

In particular, the 'Location' column contains the state name and two
types of GPS coordinates. This script finds the state name(s) and puts 
that in a new column 'State'. It also deletes the first set of GPS
coordinates and keeps the second set (of form a.b°N c.d°W) in the 
'Location' column.

The results can be seen by comparing the original file with:
'national_forests_cleaned.csv'.
"""

def find_nth(haystack, needle, n):
    start = haystack.find(needle)
    while start >= 0 and n > 1:
        start = haystack.find(needle, start+len(needle))
        n -= 1
    return start

def format():
    n = open(cd + 'new_nat_mons.csv', 'a')

    with open(cd + 'national_monuments.csv') as f:
        first = True
        for line in f:

            if first:
                first = False
                n.write(line)
                continue
            
            else:
                marker = line.find('/')
                digit = re.search('\d', line)

                n.write(line[:comma+1] + line[marker+2:])

    n.close()

if __name__ == '__main__':

    format()

    cd = #path_to_data_folder
    file_name = 'national_forests.csv'

    df = pd.read_csv(cd + file_name)

    df.loc[:,'State'] = ''


    for i, line in enumerate(df['Location'].values):
        digit_marker = re.search('\d', line)
        m = digit_marker.start()

        df.at[i, 'State'] = line[:m-1]

        slash_marker = line.find('/')

        df.at[i, 'Location'] = line[slash_marker+1:]

    save_file = 'new_monuments.csv'

    df.to_csv(cd + save_file, sep=',')

    


