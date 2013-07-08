php-db-services
===============

example code to create a object oriented framework using php to connect to mysql database and run stored procedures

How to Use

Source the addUser.sql into mysql (schema and sample data)

You can have a look at the stored procedure in  addUser.sql

BaseDao class has all the db level transactions and should be extended by all app level db classes

UserDAOImpl.php extends BaseDAo
