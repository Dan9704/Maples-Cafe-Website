-- CREATE TABLE Feedback (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   rating INT NOT NULL,
--   description TEXT,
--   created_at DATETIME DEFAULT CURRENT_TIMESTAMP
-- );

-- -- Insert a sample feedback with a random rating between 0 and 5
-- INSERT INTO Feedback (rating, description)
-- VALUES (
--   FLOOR(RAND() * 6), 
--   "This is a sample feedback with a random rating."
-- );



CREATE TABLE Feedback (
  id INT AUTO_INCREMENT PRIMARY KEY,
  rating INT NOT NULL,
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert a sample feedback with a random rating between 0 and 5
INSERT INTO Feedback (rating, description)
VALUES (
  FLOOR(RAND() * 6), 
  "This is a sample feedback with a random rating."
);
