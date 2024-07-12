USE littlelemondb;

SELECT menu.MenuName
FROM menu
INNER JOIN orders ON menu.MenuID = orders.MenuID
WHERE MenuItemsID = (SELECT MenuID FROM Orders WHERE Quantity > 2);