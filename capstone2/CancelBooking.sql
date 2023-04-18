DELIMITER $$
CREATE PROCEDURE CancelBooking (IN bkg_id INT)
BEGIN
DELETE FROM Bookings
WHERE BookingID = bkg_id;
SELECT CONCAT('Booking ', 'bkg_id', ' cancelled') as 'Confirmation';
END $$
DELIMITER ;
CALL CancelBooking(9);
DROP PROCEDURE CancelBooking;