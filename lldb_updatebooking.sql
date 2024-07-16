#Create procedure
DELIMITER //
#procedure updates a bookingID date
CREATE PROCEDURE UpdateBooking(bid INT, bookdate DATE)
BEGIN
	UPDATE Bookings SET BookingDate = bookdate
    WHERE BookingID = bid;
    SELECT CONCAT("Booking ", bid, ' has been updated to date: ', bookdate) AS Confirmation;
END //
DELIMITER ;

CALL UpdateBooking(10, "2022-12-17");

SELECT BookingID, BookingDate, TableNumber, CustomerID 
FROM Bookings;