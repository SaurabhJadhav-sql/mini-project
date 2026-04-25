==========================
Title:-Sales Database.
==========================

=================================================================================================
  
Create table Product_info
(Product_id Int Primary key,
Product_Name Varchar(50),
Product_price Int);

=================================================================================================

=================================================================================================

Create table Customers_table
(Customer_id int Primary key,
Customer_Name Varchar(50),
Customer_city Varchar(50));

=================================================================================================

=================================================================================================

Create table Orders_Table
(Order_id Int Primary Key,
Customer_id Int, Foreign Key(Customer_id) References Customers_Table(Customer_id),
Order_Date Date);

=================================================================================================

=================================================================================================

Create Table Order_items
(Order_id Int,Foreign key(Order_id) References Orders_Table(Order_id),
Product_id Int,Foreign Key(Product_id) References Product_Info(Product_id),
Quantity Int);

=================================================================================================

=================================================================================================

Insert INTO Product_Info Values
(1,'Play Station 5',60000),(2,'IQ 15R',44000),(3,'Lenovo LOQ',100000),(4,'Oppo Reno15 5G',45000),
(5,'HOPPUP Xo6 Gaming Earbuds',800),(6,'GOBOULT Astra Earbuds',1300),(7,'Boat Rockerz 421',1199),
(8,'BenQ Smart Projector',124000),(9,'Hp 15',75000),(10,'Samsung Galaxy Tab A11',33000);

===================================================================================================

===================================================================================================

Insert INTO Customers_table Values
(1,'Rohit','Pune'),(2,'Saurabh','Satara'),(3,'Aryan','Khandala'),(4,'Virat','Delhi'),
(5,'Jay','Pune'),(6,'Mohit','Pune'),(7,'Suresh','Bangalore'),
(8,'Anil','Kolkata'),(9,'Arjun ','Kolkata'),(10,'Priya','Nagpur');

====================================================================================================

=====================================================================================================

Insert INTO Orders_Table Values
(1,1,'2017-05-11'),(2,1,'2022-11-22'),(3,2,'2020-04-15'),(4,2,'2026-05-19'),
(5,3,'2025-03-14'),(6,4,'2014-12-22'),(7,5,'2023-12-31'),
(8,6,'2023-01-14'),(9,7,'2019-07-11'),(10,7,'2019-05-19'),(11,9,'2021-09-11');

=====================================================================================================

=====================================================================================================

Insert INTO Order_items Values(1,1,2),(2,3,1),(3,4,1),(4,1,1),
(5,9,1),(6,5,2),(7,3,1),
(8,4,1),(9,8,10),(10,10,1),(11,2,1);

=====================================================================================================

=====================================================================================================================
--Total Revenue

Select Sum(P.Product_price * Oi.Quantity) From Product_Info P Join Order_items Oi On P.Product_id = Oi.Product_id;

======================================================================================================================

==================================================================================================================================
--Revenue Per Customer

Select C.Customer_Name,Sum(P.Product_Price * Oi.Quantity) From Product_Info P Join Order_Items Oi On P.Product_id = Oi.Product_id 
Join Orders_Table O On O.Order_id = Oi.Order_id Join Customers_Table C On C.Customer_id = O.Customer_id Group by C.Customer_Name;  

===================================================================================================================================


==================================================================================================================================
--Top 3 Most Selling Products

Select P.Product_Name,Sum(Oi.Quantity)As Most_Selling_Products From Product_info P 
Join Order_items Oi On P.Product_id = Oi.Product_id Group by P.Product_Name Order by Sum(Oi.Quantity) Desc Limit 3;

==================================================================================================================================

==================================================================================================================================
--Customers Who Never placed an order

Select C.Customer_Name From Customers_Table C Left Join Orders_table O On C.Customer_id = O.Customer_id Where O.Order_id IS NULL;

==================================================================================================================================

======================================================================================================================================
--Average Order Value

Select Avg(Order_total)As Avg_Order_Value From(Select O.Order_id,Sum(Oi.Quantity * P.Product_price)As Order_total From Orders_Table O 
Join Order_Items Oi On O.Order_id = Oi.Order_id Join Product_Info P on Oi.Product_id = P.Product_id Group by O.Order_id)As sub;

=======================================================================================================================================

=======================================================================================================================================
--Which Customer Spent Most on a single product

Select C.Customer_name,P.Product_Name,Sum(P.Product_Price) From Customers_Table C Join Orders_Table O On C.Customer_Id = O.Customer_Id
Join Order_Items Oi On O.Order_id = Oi.Order_id
Join Product_Info P On P.Product_id = Oi.Product_id Group by C.Customer_Name,P.Product_Name Order by Sum(P.Product_Price) Desc Limit 1;

=========================================================================================================================================

========================================================================================================================================
--Which Customers Placed the Most numbers of orders?

Select C.Customer_Name,Count(O.Order_id)As Total_Orders From Customers_Table C
Join Orders_Table O On C.Customer_id = O.Customer_id Group by C.Customer_Name Order by Total_Orders Desc Limit 1; 

=========================================================================================================================================

========================================================================================================================================
--What is the average order value across all orders?

Select Avg(Ord_Values)As Avg_Order_Value From (Select O.Order_id,Sum(P.Product_price * Oi.Quantity)As Ord_Values From
Orders_table O Join Order_items Oi On O.Order_id = Oi.Order_id Join Product_info P On P.Product_id = Oi.Product_id Group by O.Order_id)t;

========================================================================================================================================

========================================================================================================================================

--Which Product is least popular (lowest total quantity sold)?

Select P.Product_Name,Sum(Oi.Quantity)As Least_Amount From Orders_Table O Join Order_Items Oi On O.Order_id = Oi.Order_id
Join Product_Info P On P.Product_id = Oi.Product_id  Group by P.Product_Name 
Having Sum(Oi.Quantity) =(select Min(Total_Qty) From (Select Sum(Quantity)AS Total_Qty From Order_items Group by Product_id));

========================================================================================================================================

========================================================================================================================================

--Which Customer has Spent the most Money in Total and how many Products did they buy?

Select C.Customer_name,Sum(P.Product_Price * Oi.Quantity)As Total_Spent,Sum(Oi.Quantity)As Total_Purchase 
From Customers_Table C Join Orders_Table O On C.Customer_id = O.Customer_id
Join Order_items Oi On O.Order_id = Oi.Order_id Join Product_info P On P.Product_id = Oi.Product_id
Group by C.Customer_Name Order by Total_Spent Desc Limit 1;  

=========================================================================================================================================

=========================================================================================================================================

--Top 3 Cities by total revenue Not just the top 1

Select C.Customer_City,Sum(P.Product_Price * Oi.Quantity)As Revenu From Customers_Table C Join Orders_Table O On C.Customer_id = O.Customer_id
Join Order_items Oi On O.Order_id = Oi.Order_id Join Product_info P On P.Product_id = Oi.Product_id
Group by C.Customer_City Order by Revenu Desc Limit 3;

===========================================================================================================================================
