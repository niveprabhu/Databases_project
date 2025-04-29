USE StormGuardReliefDB;

#Queries By Nivedita Prabhu
SELECT Name 
FROM Hurricane;

SELECT v.First_Name, v.Last_Name, r.Title
FROM Volunteer v
JOIN Volunteer_Relief vr ON v.Volunteer_id = vr.Volunteer_id
JOIN Relief r ON vr.Relief_id = r.Relief_id
WHERE r.Active = 'Active';

#Queries By Nicholas Scott Marshall


#Queries By Ayodeji Joseph Adeogun
