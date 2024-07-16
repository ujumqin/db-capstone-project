USE littlelemondb;
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE orders MODIFY COLUMN Cost decimal(10,2);

INSERT INTO Bookings(BookingID, CustomerID, FullName, EmployeeID, BookingDate, TableNumber)
VALUES('1','1','JakeH','199','2022-10-10','5'),
		('2','3','RulesA','193','2022-11-12','3'),
        ('2','2','RenII','194','2022-10-11','2'),
        ('3','1','JakeH','199','2022-10-13','2');
        
        
INSERT INTO customerdetails(CustomerID, Email, ContactNumber, Address)
VALUES('1',"Jakeh@gmail",'11111',"USA"),
		('2',"rena@hotmail",'22222',"USA"),
		('3',"rulesA@outlook",'33333',"Canada"),
		('4',"lordm@mail",'4444',"Canada");

INSERT INTO orders(OrderID,MenuID,BookingID,OrderStatusID,Quantity,Cost)
VALUES('1','1','1','1','1','100.00'),
		('2','2','2','1','2','50.00'),
		('3','2','3','2','1','60.00'),
		('4','1','4','1','2','61.00');
