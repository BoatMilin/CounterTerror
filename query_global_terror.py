#!/usr/bin/env python
# -*- coding: utf-8 -*-
import pandas as pd
import numpy as np


"""================[INSTRUCTIONS]==================================================================================================
# ATTENTION!: Everyone needs to refresh on "dynamic query for slide 9/27" & and read "http://datamaps.github.io/old.html" "http://sunsp.net/demo/GeogTreeMaps/" for this. We will keep the map

1. What was the "success", total_nkill, nwound per year for country(range: 1986 - 2016)
  => Output:        YEAR | COUNTRY | SUCCESS_RATE | TOTAL_nkill | TOTAL_wound


2. Which "country_txt" had the most "attacktype1_txt", "natlty_1txt", "weaptype1_txt" per year? sort by rank (Rank 1 - 5)
  => Output:        YEAR | COUNTRY | RANK (1-5)| ATTACKTYPE1_TXT  | TOTAL SUM OF ATTACKTYPE1_TXT
  => Output:        YEAR | COUNTRY | RANK (1-5)| NATLTY_1_TXT     | TOTAL SUM OF NATLTY1_TXT
  => Output:        YEAR | COUNTRY | RANK (1-5)| WEAPTYPE1_TXT    | TOTAL SUM OF WEAPTYPE1_TXT
  => Output:        YEAR | COUNTRY | RANK (1-5)| WEAPSUBTYPE1_TXT | TOTAL SUM OF WEAPSUBTYPE1_TXT

# Any other output that will fit with our topic


# <Future plan>
# Note: SoMi Choi & Vikhram will try to figure out how to cluster latitude, longitude a bit for country or city to make it interactive with d3.js
# Note: SoMi Choi & James Sukin Choi will collect and get the "word count" for articles for each "country" using NYT dataset (1986 - 2016)


# If we can't find interesting "patern" ....
# (Optional) => Output:    DATE (2001-MM-DD) | EventID | ... all other fields since 911 happened in 2001
(Optional) iyear|imonth|iday should be converted to date format for pd ex: YYYY-MM-DD (So we can sort by time)
=> Output: DATE (YYYY-MM-DD) | 'country' | 'country_txt' |'region' |'region_txt' |'provstate' | .... all other fields are below



==================================================================================================================================
"""

"""Global Terror Dataset summary
    attacktype1   : attacktype1_txt
            1     : Assassination
            2     : Armed Assault
            3     : Bombing/Explosion
            4     : Hijacking
            5 - 6 : Hostage Taking (Barricade Incident)
            7     : Facility/Infrastructure Attack
            8     : Unarmed Assault
            9     : Unknown
    =====================================================
       weaptype1  : weaptype1_txt
            1     : Assassination
            2     : Armed Assault
            3     : Bombing/Explosion
            4     : Hijacking
            5 - 6 : Hostage Taking (Barricade Incident)
            7     : Facility/Infrastructure Attack
            8     : Unarmed Assault
            9     : Unknown
    ======================================================
      weapsubtype1: weapsubtype1_txt (Do not filter out null value yet)
          1 - 30  : ex: Explosive, Sticky Bomb
    ======================================================
        targtype1 : targtype1_txt
          1 - 22  : ex: Police, Military

"""
CSV_FILENAME = 'globalterror.csv'
FIELDS = ['iyear', 'imonth', 'iday', # This should be somehow converted to date format ex: YYYY-MM-DD 00:00:00
          'country', 'country_txt','region', 'region_txt', 'provstate', 'city', 'latitude', 'longitude', # Location
          'attacktype1_txt', 'weaptype1_txt','weapsubtype1_txt', # Do not filter out null value yet
          'success', # 1 if success 0 if fail
          'natlty1_txt', # nationality of terrorists
          'nkill',
          'gname',
          'summary','motive'] #ex: 1/6/1970: Unknown perpetrators threw a Molotov cocktail into an Army Recruiting Station in Denver,




def readCSV(csv_name):
    df = pd.read_csv(csv_name, usecols=FIELDS)
    print str(df.keys)


if __name__ == "__main__":
    readCSV(csv_name=CSV_FILENAME)
