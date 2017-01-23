# Object State Reconstruction

[Heroku DEMO](https://objects-state-reconstruction.herokuapp.com).

[Video Demo](https://vimeo.com/199782431)

Object State Reconstruction is a web application that allows you to upload
a CSV file containing the changes in properties of different objects at
different times, and then allows you to query the state of an object at
a particular timestamp.

This is what the table would look like:

object_id | object_type | timestamp   | object_changes
:-------: | :---------: | :---------: | :------------
 1        |  Order      | 1484730554  | {"customer_name": "Jack","customer_address": "Trade St.","status": "unpaid"}
 2        |  Order      | 1484730623  | {"customer_name": "Sam","customer_address": "Gecko St.","status": "unpaid"}
 2        |  Product    | 1484731172  | {"name": "Laptop","price": 2100,"stock_levels": 29}
 1        |  Order      | 1484731481  | {"status": "paid","ship_date": "2017-01-18","shipping_provider": "DHL"}
 2        |  Product    | 1484731671  | {"name": "Microphones","price": 160,"stock_levels": 1500}
 1        |  Invoice    | 1484731920  | {"order_id": 7,"product_ids": [1,5,3],"status": "unpaid","total": 2500}
 1        |  Invoice    | 1484732821  | {"status": "paid"}
...       |  ...        |  ...        | ...

The CSV columns are:

 - **object_id:** is a unique identifier per-object type.
 - **object_type:** denotes the object type.
 - **timestamp:** needs no explanation (I displayed it in UTC for readability
   purposes)
 - **object_changes:** the properties changed for specified object at **timestamp**.

### Setting up the project
- git clone git@github.com:ChunAllen/object_state_reconstruction.git
- cd object_state_reconstruction
- bundle install
- rake db:create db:migrate

### How to use the application:
Click this link for the demo [DEMO](https://objects-state-reconstruction.herokuapp.com).

The home page allows you to upload a CSV file.

Take a look at **public/test.csv** for the ideal format of the CSV file (note that the timestamp is Unix timestamp format, and the object_changes is in JSON format).

Each time a new csv file is uploaded, the database is flushed and data from the csv file is inserted into the database.

Once the file is uploaded you are directed to a page which displays all the object changes, and allows you to filter by object id and object type and timestamp.

### Screenshots:

Object States page (search form and object states result) <img width="967" alt="screenshot 2017-01-17 14 27 16" src="https://cloud.githubusercontent.com/assets/2100728/22010128/44175cd4-dcc2-11e6-9ddc-1aee5a671b95.png">

Importing of CSV <img width="1241" alt="screenshot 2017-01-17 14 27 07" src="https://cloud.githubusercontent.com/assets/2100728/22010143/69d4e414-dcc2-11e6-9593-f71733f06e93.png">

