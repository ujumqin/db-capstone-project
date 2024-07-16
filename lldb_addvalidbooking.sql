
#Create procedure
DELIMITER //
#procedure takes a date, table number, and customer ID
CREATE PROCEDURE AddValidBooking(OUT BookStatus INT, bookdate DATE, tablenum INT, cID INT)
BEGIN
	#Need the bookingID to insert later. Take the biggest BookingID and add one to create new bookingID
	SELECT @maxbookid := MAX(BookingID)+1 FROM Bookings;

	START TRANSACTION;
    #Check to see if we have a booking for the date and time selected and put it into a temp table "BookStatus"
    SELECT COUNT(*) INTO BookStatus FROM Bookings
    WHERE BookingDate = bookdate AND TableNumber = tablenum;
    
    #If we didn't count a booking for the time and table then add it
    IF BookStatus = 0 THEN
		INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
        VALUES (@maxbookid,bookdate, tablenum, cid);
        COMMIT;
        SELECT concat('Table ', tablenum, ' successfully booked for the date ', bookdate, ' for CustomerID ', cid) AS 'Booking Status';
    #Else we don't add anything and inform the user    
	ELSE
		ROLLBACK;
        SELECT concat('Table ', tablenum, ' is already booked for the date ', bookdate, ' --booking will be cancelled. Please pick another date and table.') AS 'Booking Status';
    END IF;
END //
DELIMITER ;

#test the procedure
Call AddValidBooking(@count, "2022-10-10", 2, 6);



