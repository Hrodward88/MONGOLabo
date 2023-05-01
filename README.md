# SQL Project.

The objective of this project was to create a Database, formed of multiple dataframes in a .csv format. 

Each of these .csv files was checked in order to assess the quality of the data, and in general required minimal data cleaning.

Afterwards, when moving onto SQL, the different relations between tables need to be established, and both Principal and Foreign keys need to be assigned.

An original structure was established, with all the different columns that will be included. This was then forward engineered intothe schema that  what was named "Blockbuster".

Once all these tables and columns had been established, the tables were populated with the .csv files. however, multiple issues arose, so new tables hade to be created, the relationships re-established, and new columns created.

These columns were always containing Null values. No attempt to populate them worked, either in SQL or jupyter notebook. I treid re-establishing the foreign keys, populate them with the values of other columns, add the columns to a .csv file and then establish a foreign key and populate them... Nothing worked.

So this repository includes all I tried. From the python and SQL code, to the created structures and relationships between tables.
