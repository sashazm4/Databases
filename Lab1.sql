create table SGroup(
		GroupID SERIAL PRIMARY KEY,
		Name VARCHAR(50) NOT NULL
);

create table Student(
  		StudentID SERIAL PRIMARY KEY,
  		GroupID INTEGER REFERENCES SGroup(GroupID),
  		FirstName VARCHAR(50) NOT NULL,
  		LastName VARCHAR(50) NOT NULL,
    	Code INTEGER
);


create table Course(
  		CourseID SERIAL PRIMARY KEY,
    	Name VARCHAR(50) NOT NULL
);

create table Deadline(
 		DeadlineID SERIAL PRIMARY KEY,
    	CourseID INTEGER NOT NULL REFERENCES Course(CourseID),
    	Date DATE NOT NULL,
    	Type INTEGER NOT NULL
);

create table Mark(
    	StudentID INTEGER NOT NULL REFERENCES Student(StudentID),
   		DeadlineID INTEGER NOT NULL REFERENCES Deadline(DeadlineID),
    	Value INTEGER NOT NULL
);

INSERT INTO SGroup(Name)
VALUES ('KN');

INSERT INTO SGroup(Name)
VALUES ('Pht');

INSERT INTO SGroup(Name)
VALUES ('MM');

INSERT INTO SGroup(Name)
VALUES ('Phi');

INSERT INTO SGroup(Name)
VALUES ('AB');

INSERT INTO Student (FirstName, LastName, Code)
VALUES ('Ivan', 'Vasilenko', 123);

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (1, 'Vasilii', 'Petrov', 456);

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (2, 'Artem', 'Volobuev', 134);

INSERT INTO Student (FirstName, LastName)
VALUES ('Danil', 'Smith');

INSERT INTO Student (GroupID, FirstName, LastName, Code)
VALUES (3, 'John', 'Stones', 631);

INSERT INTO Course (Name)
VALUES ('Physics');

INSERT INTO Course (Name)
VALUES ('Mathematical analysis');

INSERT INTO Course (Name)
VALUES ('Algebra');

INSERT INTO Course (Name)
VALUES ('Computer science');

INSERT INTO Course (Name)
VALUES ('Computer graphics');

INSERT INTO Deadline (CourseID, Date, Type)
VALUES 
	(2, CURRENT_DATE + INTERVAL '7 days', 0),
    	(2, CURRENT_DATE - INTERVAL '7 days', 1),
    	(3, CURRENT_DATE + INTERVAL '3 days', 0),
    	(4, CURRENT_DATE + INTERVAL '7 days', 1),
    	(5, CURRENT_DATE - INTERVAL '5 days', 0);


INSERT INTO Mark (StudentID, DeadlineID, Value)
VALUES 
		(2, 2, 5),
    	(3, 1, 4),
    	(3, 2, 4),
    	(5, 5, 3),
    	(2, 4, 4);

SELECT SGroup.Name AS "Group Name", COUNT(Student.StudentID) AS "Number of Students"
FROM SGroup
LEFT JOIN Student ON SGroup.GroupID = Student.GroupID;

SELECT Course.Name AS "Course Name",
       COUNT(CASE WHEN Deadline.Type = 1 THEN 1 ELSE NULL END) AS "Number of Midterms"
FROM Course
LEFT JOIN Deadline ON Course.CourseID = Deadline.CourseID
GROUP BY Course.CourseID, Course.Name;


SELECT Course.CourseID, Course.Name
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2 -- here you can write StudentID that you want to check
WHERE Mark.Value IS NULL;


SELECT Course.Name, Deadline.Date, Deadline.DeadlineID
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2 -- here you can write StudentID that you want to check
WHERE Mark.Value IS NULL AND Deadline.Date < CURRENT_DATE;

SELECT Course.Name, COUNT(Deadline.DeadlineID)
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2 -- here you can write StudentID that you want to check
WHERE Mark.Value IS NULL AND Deadline.Date > CURRENT_DATE
GROUP BY Course.Name, Deadline.DeadlineID;

SELECT Course.Name, Deadline.Date, COALESCE(AVG(Mark.Value), 0) AS "Avereage Mark" 
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID 
WHERE 
Deadline.DeadlineID = 3 -- here you can write DeadlineID for that you want to count avg mark
GROUP BY Deadline.DeadlineID, Course.Name;


SELECT Course.Name, COALESCE(AVG(Mark.Value), 0) AS "Average Mark" 
FROM Course
LEFT JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID 
WHERE 
Course.CourseID = 5
GROUP BY Course.Name;


SELECT Student.StudentID, Student.FirstName, Student.LastName, COALESCE(AVG(Mark.Value), 0) AS "Average Mark" 
FROM Student
LEFT JOIN Mark ON Student.StudentID = Mark.StudentID
GROUP BY Student.StudentID;

SELECT Student.StudentID, Student.FirstName, Student.LastName,COALESCE(Count(Mark.Value), 0) AS "Number of completed exams/midterms" 
FROM Student
LEFT JOIN  Mark ON Student.StudentID = Mark.StudentID
WHERE
Student.StudentID = 5 -- here you can write StudentID that you want to check
GROUP BY Student.StudentID, Student.FirstName, Student.LastName;

SELECT Course.Name, COALESCE(Count(Mark.Value), 0) AS "Number of completed midterms" 
FROM Course
LEFT JOIN Deadline ON  Deadline.CourseID = Course.CourseID AND Deadline.Type = 1
LEFT JOIN Mark ON Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2
GROUP BY Course.Name;

SELECT Student.FirstName, Student.LastName , (SELECT COUNT(*) FROM Deadline) - COUNT(Deadline.DeadlineID) AS "Pending Midterms/Exams"
FROM Student
LEFT JOIN Mark ON Student.StudentID = Mark.StudentID
LEFT JOIN Deadline ON Mark.DeadlineID = Deadline.DeadlineID
GROUP BY Student.StudentID;