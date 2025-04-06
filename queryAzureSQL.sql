CREATE TABLE Venue (
    VenueId INT IDENTITY(1,1) PRIMARY KEY,
    VenueName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Capacity INT NOT NULL,
    ImageUrl NVARCHAR(255) NULL
);

CREATE TABLE Event (
    EventId INT IDENTITY(1,1) PRIMARY KEY,
    EventName NVARCHAR(100) NOT NULL,
    EventDate DATETIME NOT NULL,
    Description NVARCHAR(500) NULL,
    VenueId INT NOT NULL,
    CONSTRAINT FK_Event_Venue FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) ON DELETE CASCADE
);

CREATE TABLE Booking (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    EventId INT NOT NULL,
    VenueId INT NOT NULL,  
    BookingDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Booking_Event FOREIGN KEY (EventId) REFERENCES Event(EventId) ON DELETE CASCADE,
    CONSTRAINT FK_Booking_Venue FOREIGN KEY (VenueId) REFERENCES Venue(VenueId) -- Add foreign key to Venue table
);

INSERT INTO Venue (VenueName, Location, Capacity, ImageUrl)
VALUES 
('Skyline Ballroom', '10 Empire Street, Johannesburg', 800, 'https://example.com/skyline.jpg'),
('Garden Pavilion', '22 Rose Avenue, Bloemfontein', 350, 'https://example.com/gardenpavilion.jpg'),
('Lakeside Convention Centre', '88 Waterfront Blvd, Cape Town', 600, 'https://example.com/lakeside.jpg');

INSERT INTO Event (EventName, EventDate, Description, VenueId)
VALUES 
('AI & Robotics Summit', '2025-07-22 08:30:00', 'Exploring advancements in AI and robotics.', 1),
('Culinary Arts Fair', '2025-08-12 10:00:00', 'A food lover’s paradise with live cooking demos.', 2),
('Green Energy Expo', '2025-09-25 09:00:00', 'A gathering of innovators in sustainable energy.', 3);


INSERT INTO Booking (EventId, VenueId, BookingDate)
VALUES 
(1, 1, GETDATE()),  
(2, 2, GETDATE()),  
(3, 3, GETDATE()); 