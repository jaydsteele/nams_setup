# nams_setup

Nodejs and Mysql Setup!

A very simple repo to initialize a MySql database and run a nodejs web server
reading from that database. The intent is to act as a learning tool to get going.

Pre-requisites
--------------

In order to get things running without any changes to the code you'll need to:
* Set up MySql on the same machine on the default port.
* Set environment var NAMS_MYSQL_USER to the username you want to access the database
* Set environment var NAMS_MYSQL_PASSWORD to the password for that MySql user

e.g.
```bash
export NAMS_MYSQL_USER somemysqluser
export NAMS_MYSQL_PASSWORD supersecurepassword
```

Database Initialization
-----------------------
```bash
% cd script
% ./initdb.bash
```

Ensure that runs without error, and you should now have a populated database with 
some hockey stats.

Running the web server
----------------------

```bash
% cd ${NAMS_SETUP_HOME}
% npm start
```

You should get a console log message saying that the server is running.

Accessing the web page
----------------------

You can visit http://localhost:3000 to see the simple table with hockey stats
pulled from the database