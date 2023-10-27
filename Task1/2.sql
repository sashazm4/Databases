SELECT Course.Name AS "Course Name",
       COUNT(CASE WHEN Deadline.Type = 1 THEN 1 ELSE NULL END) AS "Number of Midterms"
FROM Course
LEFT JOIN Deadline ON Course.CourseID = Deadline.CourseID
GROUP BY Course.CourseID, Course.Name;