USE littlelemondb;

SELECT bookings.CustomerID, bookings.FullName, orders.OrderID, orders.Cost, menu.MenuName, menuItems.CourseName
FROM bookings
INNER JOIN orders ON bookings.BookingID = orders.BookingID
INNER JOIN menu ON orders.MenuID = menu.MenuID
INNER JOIN menuItems on menu.MenuItemsID = menuItems.MenuItemsID
