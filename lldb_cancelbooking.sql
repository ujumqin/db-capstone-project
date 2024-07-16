#Create procedure
DELIMITER //
#procedure updates a bookingID date
CREATE PROCEDURE CancelBooking(bid INT)
BEGIN
	DELETE FROM Bookings
    WHERE BookingID = bid;
    SELECT CONCAT("Booking ", bid, ' has been cancelled.') AS Confirmation;
END //
DELIMITER ;

CALL CancelBooking(10);

SELECT BookingID, BookingDate, TableNumber, CustomerID 
FROM Bookings;