USE littlelemondb;
#Need foreign_key_checks set to 0 for insert to work correctly, else error is thrown
SET FOREIGN_KEY_CHECKS=0;

#Some values will not be pulled, but need to be added to insert for the insert to work properly.
INSERT INTO Bookings(BookingID, CustomerID, FullName, EmployeeID, BookingDate, TableNumber)
VALUES('1','1','JakeH','199','2022-10-10','5'),
		('2','3','RulesA','193','2022-11-12','3'),
        ('2','2','RenII','194','2022-10-11','2'),
        ('3','1','JakeH','199','2022-10-13','2');

#Show the table
SELECT BookingID, BookingDate, TableNumber, CustomerID 
FROM Bookings;

#create the procedure
delimiter //
CREATE PROCEDURE CheckBooking(bookdate DATE, tableno INT)
BEGIN
	SELECT IF(BookingDate = bookdate, 
	IF(TableNumber = tableno, concat("Table ", tableno, " is already booked"), concat("Table ", tableno, " is not booked")), 
	concat("Table ", tableno, " is not booked")) AS "Booking Status"
	FROM Bookings
	WHERE TableNumber = tableno;
END //
delimiter ;

#test the procedure. if no values show, then booking is available
CALL CheckBooking("2022-11-12",1)