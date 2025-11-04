-- Write your PostgreSQL query statement below
SELECT Employee.name,Bonus.bonus FROM Employee 
LEFT JOIN Bonus ON Bonus.empID = Employee.empID
WHERE bonus < 1000 OR Bonus IS NULL ;