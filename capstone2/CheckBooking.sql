DELIMITER $$
CREATE PROCEDURE CheckBooking (IN bok_date DATE, IN t_no INT)
BEGIN
DECLARE BookingStatus VARCHAR(10);
IF EXISTS (SELECT * FROM Bookings WHERE BookingDate = bok_date AND TableNumber = t_no)
THEN
SET @BookingStatus = 'TRUE';
SELECT @BookingStatus AS BookingStatus;
SELECT 'Table is already booked';
ELSE
SET @BookingStatus = 'FALSE';
SELECT @BookingStatus AS BookingStatus;
SELECT 'Table is not booked';
END IF;
END $$
DELIMITER ;
CALL CheckBooking;