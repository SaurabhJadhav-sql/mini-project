==========================
Title:-Sales Database.
==========================

============================================================================================================================================================================================
  
Create table Product_info(Product_id Int Primary key,Product_Name Varchar(50),Product_price Int);
Create table Customers_table(Customer_id int Primary key,Customer_Name Varchar(50),Customer_city Varchar(50));
Create table Orders_Table(Order_id Int Primary Key,Customer_id Int, Foreign Key(Customer_id) References Customers_Table(Customer_id),Order_Date Date);
Create Table Order_items(Order_id Int,Foreign key(Order_id) References Orders_Table(Order_id),Product_id Int,Foreign Key(Product_id) References Product_Info(Product_id),Quantity Int);

=============================================================================================================================================================================================
