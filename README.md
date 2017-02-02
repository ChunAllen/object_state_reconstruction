# Object State Reconstruction

[Heroku Demo](https://object-state-reconstruction.herokuapp.com).

[Video Demo](https://vimeo.com/202241910)

Object State Reconstruction is a web application that allows you to upload
a CSV file containing the changes in properties of different objects at
different times, and then allows you to query the state of an object at
a particular timestamp.

This is what the table would look like based on the CSV file under **public/test.csv**:

object_id | object_type | timestamp   | object_changes
:-------: | :---------: | :---------: | :------------
 1        |  Order      | 1484730554  | {"customer_name": "Jack","customtomer_address": "Trade St.","status": "unpaid"}
 2        |  Order      | 1484730623  | {"customer_name": "Sam","customer_address": "Gecko St.","status": "unpaid"}
 1        |  Product    | 1484731172  | {"name": "Laptop","price": 2100,"stock_levels": 29}
 1        |  Order      | 1484731481  | {"status": "paid","ship_date": "2017-01-18","shipping_provider": "DHL"}
 2        |  Product    | 1484731671  | {"name": "Microphones","price": 160,"stock_levels": 1500}
 1        |  Invoice    | 1484731920  | {"order_id": 7,"product_ids": [1,5,3],"status": "unpaid","total": 2500}
 1        |  Invoice    | 1484732821  | {"status": "paid"}
...       |  ...        |  ...        | ...

The CSV columns are:

 - **object_id:** is a unique identifier per-object type.
 - **object_type:** denotes the object type.
 - **timestamp:** needs no explanation
 - **object_changes:** the properties changed for specified object at **timestamp**.

### Setting up the project
- git clone git@github.com:ChunAllen/object_state_reconstruction.git
- cd object_state_reconstruction
- bundle install
- cp config/database.yml.sample config/database.yml
- rake db:create db:migrate

### How to use the application:
Click this link for the demo [DEMO](https://object-state-reconstruction.herokuapp.com).

The home page allows you to upload a CSV file.

Take a look at **public/test.csv** for the ideal format of the CSV file (note that the timestamp is Unix timestamp format, and the object_changes is in JSON format).

Each time a new csv file is uploaded, the database is flushed and data from the csv file is inserted into the database.

Once the file is uploaded you are directed to a page which displays all the object changes, and allows you to filter by object id and object type and timestamp.

### Screenshots:

Importing of CSV
<img width="1003" alt="screenshot 2017-01-23 10 59 54"
src="https://cloud.githubusercontent.com/assets/2100728/22189993/2a0b17de-e15b-11e6-90fa-e23bac87c64d.png">

Object States page (search form and object states result)
<img width="965" alt="screenshot 2017-01-23 10 59 46"
src="https://cloud.githubusercontent.com/assets/2100728/22190009/3e217222-e15b-11e6-8185-892d400298bb.png">


