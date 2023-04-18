DELIMITER $$
CREATE PROCEDURE AddValidBooking (IN bkn_date DATE, IN tbl_no INT)
BEGIN
DECLARE exit handler for sqlexception
BEGIN
ROLLBACK;
END;
DECLARE exit handler for sqlwarning
BEGIN
ROLLBACK;
END;
START TRANSACTION;
INSERT INTO Bookings (BookingDate, TableNumber) VALUES (bkn_date, tbl_no);
COMMIT;
END $$
DELIMITER ;
CALL AddValidBooking("2022-12-17", 6);