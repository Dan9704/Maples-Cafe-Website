DROP TABLE IF EXISTS employee_apply;

CREATE TABLE employee_apply (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL,
    store VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    education VARCHAR(255) NOT NULL,
    experience VARCHAR(255),
    description TEXT,
    status VARCHAR(20) DEFAULT 'Submitted',
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO employee_apply (
--     name, 
--     position, 
--     store, 
--     email, 
--     phone, 
--     address, 
--     gender, 
--     education, 
--     experience, 
--     description, 
--     status
-- ) VALUES (
--     'John Doe', 
--     'Sales Associate', 
--     'Downtown Store', 
--     'john.doe@example.com', 
--     '123-456-7890', 
--     '123 Elm Street, Springfield, IL, 62704', 
--     'Male', 
--     'Bachelor of Business Administration', 
--     '3 years at XYZ Retail', 
--     'Looking forward to contributing to your sales team and bringing my retail experience to your esteemed store.',
--     'Submitted'
-- );



INSERT INTO employee_apply (
    name, 
    position, 
    store, 
    email, 
    phone, 
    address, 
    gender, 
    education, 
    experience, 
    description, 
    status
) VALUES 
('Alice Johnson', 'Cashier', 'Main Street Store', 'alice.johnson@example.com', '987-654-3210', '456 Oak Avenue, Springfield, IL, 62701', 'Female', 'High School Diploma', '1 year at ABC Supermarket', 'Excited to join your team and provide excellent service to your customers.', 'Submitted'),
('Michael Smith', 'Manager', 'West End Store', 'michael.smith@example.com', '111-222-3333', '789 Maple Street, Springfield, IL, 62702', 'Male', 'Bachelor of Commerce', '5 years at XYZ Retail as Assistant Manager', 'Seeking to take on a leadership role and drive success in your store.', 'Submitted'),
('Emily Williams', 'Customer Service Representative', 'Eastside Mall Store', 'emily.williams@example.com', '555-123-4567', '789 Pine Street, Springfield, IL, 62703', 'Female', 'Associate Degree in Business Administration', '2 years at ABC Retail as Sales Associate', 'Passionate about delivering exceptional customer service and solving problems efficiently.', 'Submitted'),
('David Brown', 'Stock Clerk', 'City Center Store', 'david.brown@example.com', '222-333-4444', '101 Oakwood Drive, Springfield, IL, 62705', 'Male', 'High School Diploma', '6 months at DEF Superstore', 'Eager to organize and maintain inventory effectively in your store.', 'Submitted'),
('Jennifer Miller', 'Assistant Manager', 'Northside Outlet', 'jennifer.miller@example.com', '777-888-9999', '202 Maple Avenue, Springfield, IL, 62706', 'Female', 'Bachelor of Business Administration', '2 years at GHI Retail as Sales Associate', 'Excited to support store operations and drive team performance.', 'Submitted'),
('James Wilson', 'Security Guard', 'Sunset Plaza Store', 'james.wilson@example.com', '333-444-5555', '303 Elmwood Drive, Springfield, IL, 62707', 'Male', 'High School Diploma', '1 year experience in security services', 'Committed to ensuring a safe environment for customers and employees.', 'Submitted'),
('Emma Garcia', 'Cashier', 'Riverfront Store', 'emma.garcia@example.com', '999-888-7777', '404 Pine Avenue, Springfield, IL, 62708', 'Female', 'High School Diploma', '3 months at JKL Mart', 'Dedicated to providing efficient checkout service and positive customer interactions.', 'Submitted'),
('Daniel Rodriguez', 'Sales Associate', 'South End Store', 'daniel.rodriguez@example.com', '666-777-8888', '505 Oakwood Lane, Springfield, IL, 62709', 'Male', 'Associate Degree in Marketing', '1 year at MNO Retail as Customer Service Representative', 'Passionate about helping customers find the products they need.', 'Submitted'),
('Olivia Martinez', 'Store Manager', 'Central Plaza Store', 'olivia.martinez@example.com', '444-555-6666', '606 Maplewood Road, Springfield, IL, 62710', 'Female', 'Bachelor of Business Administration', '3 years at PQR Retail as Assistant Manager', 'Excited to lead and develop a high-performing team.', 'Submitted'),
('Alexander Brown', 'Sales Associate', 'Westside Mall Store', 'alexander.brown@example.com', '777-666-5555', '707 Elmwood Avenue, Springfield, IL, 62711', 'Male', 'High School Diploma', '6 months at STU Supermarket', 'Passionate about providing exceptional service and exceeding sales targets.', 'Submitted'),
('Sophia Hernandez', 'Customer Service Representative', 'Southgate Store', 'sophia.hernandez@example.com', '222-555-8888', '808 Pine Lane, Springfield, IL, 62712', 'Female', 'Associate Degree in Business Administration', '1 year at VWX Retail as Cashier', 'Dedicated to resolving customer inquiries and issues with professionalism.', 'Submitted'),
('Mason Young', 'Stock Clerk', 'East End Store', 'mason.young@example.com', '333-222-1111', '909 Oak Avenue, Springfield, IL, 62713', 'Male', 'High School Diploma', '3 months at YZ Retail', 'Detail-oriented and organized, committed to maintaining accurate inventory records.', 'Submitted');
