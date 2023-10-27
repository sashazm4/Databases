SELECT Course.Name, COALESCE(Count(Mark.Value), 0) AS "Number of completed midterms" 
FROM Course
LEFT JOIN Deadline ON  Deadline.CourseID = Course.CourseID AND Deadline.Type = 1
LEFT JOIN Mark ON Deadline.DeadlineID = Mark.DeadlineID AND Mark.StudentID = 2
GROUP BY Course.Name;