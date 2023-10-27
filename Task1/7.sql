SELECT Course.Name, COALESCE(AVG(Mark.Value), 0) AS "Average Mark" 
FROM Course
LEFT JOIN Deadline ON Course.CourseID = Deadline.CourseID
LEFT JOIN  Mark ON  Deadline.DeadlineID = Mark.DeadlineID 
WHERE 
Course.CourseID = 5
GROUP BY Course.Name;