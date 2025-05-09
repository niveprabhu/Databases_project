USE StormGuardReliefDB;

-- Queries By Nivedita Prabhu

# Basic 1: Gets the names of Each Hurricane
SELECT Name 
	FROM Hurricane;
# Basic 2:  Get all relief efforts that are not active.
SELECT 
    Relief_id, Title, Type 
FROM 
    Relief 
WHERE 
    Active != 'Active';

# Advanced 1 Retrieves the first and last names of volunteers along with the titles of the active relief efforts they are currently assigned to.
SELECT v.First_Name, v.Last_Name, r.Title
	FROM Volunteer v
	JOIN Volunteer_Relief vr ON v.Volunteer_id = vr.Volunteer_id
	JOIN Relief r ON vr.Relief_id = r.Relief_id
	WHERE r.Active = 'Active';
    
# Advanced 2: Find countries affected by hurricanes with severity >= 4 and list the hurricanes with their severity.
SELECT 
    l.Name AS Country, 
    h.Name AS Hurricane, 
    h.Severity
FROM 
    Hurricane h
JOIN 
    Hurricane_Affects ha ON h.Event_id = ha.Event_id
JOIN 
    Location l ON ha.Country_id = l.Country_id
WHERE 
    h.Severity >= 4
ORDER BY 
    h.Severity DESC;

# Advanced 3: List the number of volunteers per region and show only regions with more than 5 volunteers.
SELECT 
    Assigned_Region, 
    COUNT(Volunteer_id) AS Volunteer_Count
FROM 
    Volunteer
GROUP BY 
    Assigned_Region
HAVING 
    Volunteer_Count > 5;
    
/*_______________________________________________________________________*/

-- Queries By Nicholas Scott Marshall

# Basic 1: one sentence description in the comment 
SELECT *
	FROM Logistics
	WHERE Delivery_Status = 'Ongoing';

# Basic 2: one sentence description in the comment 

# Advanced 1 : one sentence description in the comment 
SELECT l.Name AS Location,
	COUNT(r.Relief_id) AS Total_Relief_Requests,
	GROUP_CONCAT(r.Title SEPARATOR ', ') AS Relief_Titles
	FROM Location l
	JOIN Country_Requests_Relief cr ON l.Country_id = cr.Country_id
	JOIN Relief r ON cr.Relief_id = r.Relief_id
	GROUP BY l.Name;
    
# Advanced 2: one sentence description in the comment

# Advanced 3: one sentence description in the comment  

/*_______________________________________________________________________*/

-- Queries By Ayodeji Joseph Adeogun

# Basic 1: one sentence description in the comment 
SELECT 
    r.Relief_id, 
    r.Title, 
    r.Type, 
    r.Active, 
    l.Delivery_Status
	
    FROM Relief r
	JOIN Logistics l ON r.Relief_id = l.Relief_id
	WHERE r.Active = 'Active';

# Basic 2: one sentence description in the comment 

SELECT Relief_id, Title, Type, Active
FROM Relief;

# Advanced 1: one sentence description in the comment 	
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
    
# Advanced 2: one sentence description in the comment
SELECT 
    r.Relief_id,
    r.Title,
    l.Supply_Status,
    l.Delivery_Status,
    COUNT(vr.Volunteer_id) AS Assigned_Volunteers
FROM Relief r
JOIN Logistics l ON r.Relief_id = l.Relief_id
LEFT JOIN Volunteer_Relief vr ON r.Relief_id = vr.Relief_id
WHERE r.Active = 'Active'
GROUP BY r.Relief_id, r.Title, l.Supply_Status, l.Delivery_Status;

# Advanced 3: one sentence description in the comment  
SELECT 
    v.Assigned_Region,
    COUNT(DISTINCT r.Relief_id) AS Relief_Count,
    COUNT(DISTINCT v.Volunteer_id) AS Volunteers,
    GROUP_CONCAT(DISTINCT l.Delivery_Status SEPARATOR ', ') AS Delivery_Statuses
FROM Volunteer v
JOIN Volunteer_Relief vr ON v.Volunteer_id = vr.Volunteer_id
JOIN Relief r ON vr.Relief_id = r.Relief_id
JOIN Logistics l ON r.Relief_id = l.Relief_id
GROUP BY v.Assigned_Region;
