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
