USE StormGuardReliefDB2;

-- Queries By Nivedita Prabhu

# Basic 1: one sentence description in the comment 
SELECT Name 
	FROM Hurricane;
# Basic 2: one sentence description in the comment 

# Advanced 1 : one sentence description in the comment 
SELECT v.First_Name, v.Last_Name, r.Title
	FROM Volunteer v
	JOIN Volunteer_Relief vr ON v.Volunteer_id = vr.Volunteer_id
	JOIN Relief r ON vr.Relief_id = r.Relief_id
	WHERE r.Active = 'Active';
    
# Advanced 2: one sentence description in the comment

# Advanced 3: one sentence description in the comment  

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

# Advanced 3: one sentence description in the comment  
