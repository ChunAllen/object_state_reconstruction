# Object State Reconstruction

[DEMO](https://objects-state-reconstruction.herokuapp.com).

Object State Reconstruction is a web application that allows you to upload
a CSV file containing the changes in properties of different objects at
different times, and then allows you to query the state of an object at
a particular timestamp.

This is what the table would look like:

object_id | object_type | timestamp | object_changes
:-------: | :---------: | :--------: | :------------
 1        |  ObjectA    |  412351252 | {"property1": "value", "property3": "value"}
 1        |  ObjectB    |  456662343 | {"property1": "value"}
 1        |  ObjectA    |  467765765 | {"property1": "altered value", "property2": "value"}
 2        |  ObjectA    |  451232123 | {"property2": "value"}
...       |  ...        |  ...       | ...

The CSV columns are:

 - **object_id:** is a unique identifier per-object type.
 - **object_type:** denotes the object type.
 - **timestamp:** needs no explaination
 - **object_changes:** the properties changed for specified object at **timestamp**.

### How to use the application:
Click this link for the demo [DEMO](https://objects-state-reconstruction.herokuapp.com).

The home page allows you to upload a CSV file.

Take a look at public/test.csv for the ideal format of the CSV file (note that the timestamp is Unix timestamp format, and the object_changes is in JSON format).

Each time a new csv file is uploaded, the database is flushed and data from the csv file is inserted into the database.

Once the file is uploaded you are directed to a page which displays all the object changes, and allows you to filter by object type, object type and object id and object type, object id and timestamp.

### Screenshots:

Object States page (search form and object states result) <img width="967" alt="screenshot 2017-01-17 14 27 16" src="https://cloud.githubusercontent.com/assets/2100728/22010128/44175cd4-dcc2-11e6-9ddc-1aee5a671b95.png">

Importing of CSV <img width="1241" alt="screenshot 2017-01-17 14 27 07" src="https://cloud.githubusercontent.com/assets/2100728/22010143/69d4e414-dcc2-11e6-9593-f71733f06e93.png">

