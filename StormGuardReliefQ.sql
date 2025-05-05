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
SELECT *
	FROM Logistics
	WHERE Delivery_Status = 'Ongoing';

SELECT l.Name AS Location,
	COUNT(r.Relief_id) AS Total_Relief_Requests,
	GROUP_CONCAT(r.Title SEPARATOR ', ') AS Relief_Titles
	FROM Location l
	JOIN Country_Requests_Relief cr ON l.Country_id = cr.Country_id
	JOIN Relief r ON cr.Relief_id = r.Relief_id
	GROUP BY l.Name;


#Queries By Ayodeji Joseph Adeogun
SELECT 
    r.Relief_id, 
    r.Title, 
    r.Type, 
    r.Active, 
    l.Delivery_Status
	
    FROM Relief r
	JOIN Logistics l ON r.Relief_id = l.Relief_id
	WHERE r.Active = 'Active';
		
SELECT 
    r.Title AS Relief_Title,
    r.Type,
    r.Active,
    l.Supply_Status,
    l.Delivery_Status,
    v.Assigned_Region,
	
    COUNT(v.Volunteer_id) AS Total_Volunteers
	FROM Relief r
	JOIN Logistics l ON r.Relief_id = l.Relief_id
	JOIN Volunteer v ON v.Assigned_Region IS NOT NULL
	GROUP BY r.Title, r.Type, r.Active, l.Supply_Status, l.Delivery_Status, v.Assigned_Region;
