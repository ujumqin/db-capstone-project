#Create procedure
DELIMITER //
#procedure takes a booking ID, customerID, booking date, and table number and adds it to the bookings table
CREATE PROCEDURE AddBooking(bid INT, cID INT, bookdate DATE, tablenum INT)
BEGIN
	INSERT INTO Bookings(BookingID, CustomerID, BookingDate, TableNumber)
    VALUES(bid, cid, bookdate, tablenum);
    SELECT CONCAT("New booking added") AS Confirmation;
END //
DELIMITER ;

#test the procedure. order of parameters: BookingID, CustomerID, BookingDate, TableNumber
#will throw error if BookingID already exists
CALL AddBooking(10,3,"2022-12-30",4);




