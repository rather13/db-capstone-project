DELIMITER $$
CREATE PROCEDURE UpdateBooking (IN bk_id INT, IN bk_date DATE)
BEGIN
UPDATE Bookings
SET
BookingDate = bk_date WHERE BookingID = bk_id;
SELECT CONCAT('Booking', 'bk_id', 'updated') as 'Confirmation';
END $$
DELIMITER ;
CALL UpdateBooking (9, "2022-12-17");