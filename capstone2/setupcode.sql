ALTER TABLE Orders ADD Quantity INT;
SELECT * FROM Orders;
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email) VALUES (1, "Mei Lin", "111-1111", "a@blah.com"), 
(2, "Maneet Chauhan", "222-2222", "b@blah.com"), (3, "Jet Tila", "333-3333", "c@blah.com"), (4, "Antonia Lafaso", "444-4444", "d@blah.com");
SELECT * FROM Customers;
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID) VALUES (1, "2022-10-10", 5, 1), (2, "2022-11-12", 3, 3),
(3, "2022-10-11", 2, 2), (4, "2022-10-13", 2, 1);
SELECT * FROM Bookings;
INSERT INTO MenuItems (MenuItemsID, CourseName, StarterName, DessertName) VALUES (1, "Pasta", "Breadsticks", "Tiramisu"), 
(2, "Lasagne", "Stuffed Mushrooms", "Cake"), (3, "Chicken", "Cheese Sticks", "Pie"), (4, "Steak", "Nachos", "Pudding");
SELECT * FROM MenuItems;
INSERT INTO Menus (MenuID, MenuItemsID, MenuName, Cuisine) VALUES (1, 1, "Pasta", "Greek"), (2, 2, "Lasagne", "Italian"), 
(3, 3, "Chicken", "American"), (4, 4, "Steak", "Mexican");
SELECT * FROM Menus;
INSERT INTO Orders (OrderID, MenuID, CustomerID, TotalCost, Quantity) VALUES (1, 1, 1, 40.00, 1), (2, 2, 2, 100.00, 3), 
(3, 3, 3, 200.00, 5), (4, 4, 4, 150, 2);
SELECT * FROM Orders;
