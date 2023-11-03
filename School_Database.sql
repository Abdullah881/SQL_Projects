
USE db_school
Create TABLE classes(
    class_id INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
    class_name VARCHAR(50) not null
);

SELECT * From classes

CREATE TAble instructors (
    instructor_id INT NOT NULL PRIMARY KEY IDENTITY(1,1) ,
    instructor_name VARCHAR(50) not null
);

CREATE TAble students (
    student_id INT NOT NULL PRIMARY KEY IDENTITY(0,1) ,
    student_name VARCHAR(50) not null
);


-- Add the Class_ID column to the Students table
ALTER TABLE Students
ADD Class_ID INT;

-- Add the Class_ID foreign key
ALTER TABLE Students
ADD CONSTRAINT FK_Students_Class
FOREIGN KEY (Class_ID)
REFERENCES Classes(Class_ID);


-- Add the instructor_id column to the Students table
ALTER TABLE Students
ADD instructor_id INT;


-- Add the Instructor_ID foreign key
ALTER TABLE Students
ADD CONSTRAINT FK_Students_Instructor
FOREIGN KEY (Instructor_ID)
REFERENCES Instructors(Instructor_ID);


SELECT * FROM students

INSERT INTO classes values
('Software Developer Boot Camp'),('C# Boot Camp');


SELECT * FROM instructors

INsert INTO instructors values 
('Sam Willamson'), ('David Drury');

-- Insert six random student entries
INSERT INTO students
VALUES
    ('Alice', 1, 1),
    ('Bob', 1, 2),
    ('Charlie', 2, 1),
    ('David', 2, 2),
    ('Eva', 1, 1),
    ('Frank', 2, 2);

SELECT * FROM students 
order by student_name desc


SELect * FROM students
INNER join classes on students.Class_ID = classes.class_id
inner join instructors on students.instructor_id = instructors.instructor_id


SELECT DISTINCT s.*, c.class_name, i.instructor_name
FROM students s
INNER JOIN classes c ON s.Class_ID = c.class_id
INNER JOIN instructors i ON s.instructor_id = i.instructor_id;
