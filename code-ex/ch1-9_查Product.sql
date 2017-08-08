SELECT ProductID, Name, ListPrice
FROM   Production.Product
WHERE  ListPrice > $40
ORDER  BY ListPrice ASC