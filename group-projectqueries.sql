USE mydb;
SELECT c.First_Name, c.Last_Name, ot.Product_Price AS price,o.Order_Date
FROM customers c
            JOIN orders o ON c.idCustomers = o.Customers_idCustomers
            JOIN order_items ot ON o.idOrders = ot.Orders_idOrders
-- JOIN albums a ON  ot.Albums_idAlbums = a.idAlbums
WHERE  Order_Date BETWEEN '2020-08-20' AND '2020-09-20'

HAVING  ot.Product_Price > AVG(ot.Product_Price);

-- Ques 2
-- Top Sold product and least Sold Product
USE mydb;
 SELECT  '2020-09-19 to 2020-09-25' AS Weekly,  MAX( ot.Product_quantity) AS Top_sold , MIN(ot.Product_Price) AS Least_sold
 FROM  order_items ot
             JOIN orders o ON ot.Orders_idOrders = o.idOrders
             WHERE Order_Date BETWEEN '2020-09-19' AND '2020-09-25';
          
-- Ques 3
 
USE mydb;
SELECT MAX(a.Album_price) AS Max_Price , g.Genre
FROM albums a
            JOIN genre g ON a.Genre_idGenre = g.idGenre
            GROUP BY g.Genre
            ORDER BY Max_Price DESC;
            
--  Ques 4
 USE mydb;
 SELECT city,country,Province,  COUNT(*) AS no_of_customers FROM customers 
 GROUP BY city,country,Province
 ORDER BY no_of_customers DESC;

-- Question 5
-- sql_mode= "NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" ;
USE myDb;
DROP FUNCTION IF EXISTS product_sales;
DELIMITER //
CREATE FUNCTION product_sales
(
sales_month DATE
)
RETURNS INT
DETERMINISTIC READS SQL DATA
BEGIN 
    DECLARE product_number INT;
    SELECT SUM(ot.Product_quantity)
    INTO product_number
    FROM order_items ot
    JOIN orders o ON ot.Orders_idOrders= o.idOrders
    WHERE MONTH(o.Order_Date) = sales_month;
    RETURN (product_number);
    END//
    DELIMITER ;
    SELECT product_sales(MONTH('2020-09-19')) AS In_september_month;
    
    
-- Ques 6
    SELECT a.Artist_First_Name, a.Artist_Last_Nmae ,ab.Album_name, COUNT(DISTINCT ab.idAlbums) AS no_of_albums
    FROM artist a
    JOIN albums ab ON a.idArtist = ab.Artist_idArtist
     GROUP BY a.idArtist;
     
     -- Ques 7
     SELECT  Album_name,SUM(Num_of_songs) AS num_of_songs
     FROM albums
      GROUP BY Album_name
     ORDER BY num_of_songs ;
     
-- Ques 8 
SELECT  i.Instrument_Name ,a.Album_name
   FROM albums a
                JOIN albums_has_instruments ai ON a.idAlbums = ai.Albums_idAlbums
                JOIN instruments i ON ai.Instruments_idInstruments=i.idInstruments
                GROUP BY a.Album_name, i.Instrument_Name;
                
-- Ques 9
SELECT  i.Instrument_Name AS least_popular_instrument
FROM instruments i
WHERE i.idInstruments NOT IN (SELECT Instruments_idInstruments FROM albums_has_instruments);
                
			

             
		
             
        
 
