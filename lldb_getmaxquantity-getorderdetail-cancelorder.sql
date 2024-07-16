delimiter //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS "Max Quantity in Order"
	FROM Orders;
END//
delimiter ;


PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, Cost
FROM Orders, Bookings
WHERE CustomerID = ?';


delimiter //
CREATE PROCEDURE CancelOrder(OID INT)
BEGIN
DELETE FROM Orders
WHERE OrderID = OID;
SELECT CONCAT("Order", OID, " is cancelled") AS Confirmation;
END //
delimiter ;
