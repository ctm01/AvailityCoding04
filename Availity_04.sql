--Homework #7 (coding #4):
--a) Reverse-Order Customers starting with S
SELECT C.FirstName, C.LastName
FROM Customer C
WHERE C.LastName LIKE '[S]%'
ORDER BY C.LastName DESC

--b) Total value in past 6 months
SELECT ISNULL(SUM((ol.Cost * ol.Quantity)),0) AS total_order, (c.LastName + ', ' + c.FirstName) AS Customer
FROM Customer c
	 JOIN ([ORDER] o
			LEFT JOIN [OrderLine] ol ON o.OrderID=ol.OrdID)
	 ON c.CustID=o.CustomerID
WHERE DATEDIFF(MM, o.OrderDate, GETDATE()) < 6 
GROUP BY c.LastName, c.FirstName

--c) Value between $100 $ $500 in past 6 months
SELECT ISNULL(SUM((ol.Cost * ol.Quantity)),0) AS total_order, (c.LastName + ', ' + c.FirstName) AS Customer
FROM Customer c
	 JOIN ([ORDER] o
			LEFT JOIN [OrderLine] ol ON o.OrderID=ol.OrdID)
	 ON c.CustID=o.CustomerID
WHERE (DATEDIFF(MM, o.OrderDate, GETDATE()) < 6) 
GROUP BY c.LastName, c.FirstName
HAVING SUM(ol.Cost * ol.Quantity) BETWEEN 100 AND 500