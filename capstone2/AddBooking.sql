DELIMITER $$
CREATE PROCEDURE AddBooking (IN b_id INT, IN c_id INT, IN b_date DATE, IN table_no INT)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber) VALUES (b_id, c_id, b_date, table_no);
SELECT 'New booking added' as 'Confirmation';
END $$
DELIMITER ;
CALL AddBooking (9, 3, "2022-12-30", 4);