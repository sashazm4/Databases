SELECT Course.Name, Deadline.Date, COALESCE(AVG(Mark.Value), 0) AS "Avereage Mark" 
FROM Course
INNER JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID 
WHERE 
Deadline.DeadlineID = 3 
GROUP BY Deadline.DeadlineID, Course.Name;