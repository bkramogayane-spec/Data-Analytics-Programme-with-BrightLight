---1. List all orders along with the customer name and product name.
SELECT 
    OrderID,
    OrderDate,
    CustomerName,
    ProductName,
    Quantity
FROM ORDERS.ORDERSLARGE.LARGEORDERS AS A
INNER JOIN CUSTOMERS.CUSTOMERLARGE.LARGECUSTOMERS AS B ON A.CustomerID = B.CustomerID
INNER JOIN PRODUCTS.PRODUCTSLARGE.LARGEPRODUCTS AS C ON A.ProductID = C.ProductID;

---2. Which customers have placed at least one order
SELECT 
    A.CUSTOMERID,
    CustomerName,
    Country,
    OrderID,
    OrderDate
FROM CUSTOMERS.CUSTOMERLARGE.LARGECUSTOMERS AS A
INNER JOIN ORDERS.ORDERSLARGE.LARGEORDERS AS B ON A.CUSTOMERID = B.CUSTOMERID;

---3. List all customers and any orders they might have placed. Include customers who have not placed any orders.
SELECT 
    A.CUSTOMERID,
    CustomerName,
    Country,
    OrderID,
    OrderDate,
    ProductID,
    Quantity
FROM CUSTOMERS.CUSTOMERLARGE.LARGECUSTOMERS AS A
LEFT JOIN ORDERS.ORDERSLARGE.LARGEORDERS AS B ON A.CustomerID = B.CustomerID;

---4. List all products and how many times each was ordered (if any).
SELECT 
    A.PRODUCTID,
    ProductName,
    COUNT(OrderID) AS TotalOrders
FROM PRODUCTS.PRODUCTSLARGE.LARGEPRODUCTS AS A
LEFT JOIN ORDERS.ORDERSLARGE.LARGEORDERS AS B ON A.ProductID = B.ProductID
GROUP BY A.ProductID, A.ProductName;

---5. Find all orders along with product details, including any products that might not have been ordered.
SELECT 
    OrderID,
    OrderDate,
    A.PRODUCTID,
    ProductName,
    Price,
    Quantity
FROM ORDERS.ORDERSLARGE.LARGEORDERS AS A
RIGHT JOIN PRODUCTS.PRODUCTSLARGE.LARGEPRODUCTS AS B ON A.ProductID = B.ProductID;

---6. Which customers have made orders, and include customers even if they have never placed an order.
SELECT 
    A.CUSTOMERID,
    CustomerName,
    Country,
    OrderID,
    OrderDate,
    ProductID,
    Quantity
FROM ORDERS.ORDERSLARGE.LARGEORDERS AS A
RIGHT JOIN CUSTOMERS.CUSTOMERLARGE.LARGECUSTOMERS AS B ON A.CustomerID = B.CustomerID;

---7. List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.

SELECT 
    A.CUSTOMERID,
    CustomerName,
    Country,
    OrderID,
    OrderDate,
    ProductID,
    Quantity
FROM CUSTOMERS.CUSTOMERLARGE.LARGECUSTOMERS AS A
FULL OUTER JOIN ORDERS.ORDERSLARGE.LARGEORDERS AS B ON A.CustomerID = B.CustomerID;

---8. List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
SELECT 
    A.PRODUCTID,
    ProductName,
    Price,
    OrderID,
    OrderDate,
    CustomerID,
    Quantity
FROM PRODUCTS.PRODUCTSLARGE.LARGEPRODUCTS AS A
FULL OUTER JOIN ORDERS.ORDERSLARGE.LARGEORDERS AS B ON A.ProductID = B.ProductID;
