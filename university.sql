SELECT * FROM student_data;

SELECT COUNT(*) AS total_rows
FROM student_data;

ALTER TABLE
 student_data CHANGE MyUnknownColumn university text;
 
ALTER TABLE student_data
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

SELECT
    university,
    Private,
    Apps,
    Accept,
    Enroll,
    Top10perc,
    Top25perc,
    `F.Undergrad`,
    `P.Undergrad`,
    Outstate,
    `Room.Board`,
    Books,
    Personal,
    PhD,
    Terminal,
    `S.F.Ratio`,
    `perc.alumni`,
    Expend,
    `Grad.Rate`
FROM student_data
WHERE
    university IS NULL
   OR Private IS NULL
   OR Apps IS NULL
   OR Accept IS NULL
   OR Enroll IS NULL
   OR Top10perc IS NULL
   OR Top25perc IS NULL
   OR `F.Undergrad` IS NULL
   OR `P.Undergrad` IS NULL
   OR Outstate IS NULL
   OR `Room.Board` IS NULL
   OR Books IS NULL
   OR Personal IS NULL
   OR PhD IS NULL
   OR Terminal IS NULL
   OR `S.F.Ratio` IS NULL
   OR `perc.alumni` IS NULL
   OR Expend IS NULL
   OR `Grad.Rate` IS NULL;


SELECT *
FROM student_data
WHERE
    Apps < 0
   OR Accept < 0
   OR Enroll < 0
   OR Top10perc < 0 OR Top10perc > 100
   OR Top25perc < 0 OR Top25perc > 100
   OR `F.Undergrad` < 0
   OR `P.Undergrad` < 0
   OR Outstate < 0
   OR `Room.Board` < 0
   OR Books < 0
   OR Personal < 0
   OR PhD < 0 
   OR Terminal < 0 OR Terminal > 100
   OR `S.F.Ratio` < 0
   OR `perc.alumni` < 0 OR `perc.alumni` > 100
   OR Expend < 0
   OR `Grad.Rate` < 0 OR `Grad.Rate` > 100;

SELECT * FROM student_data
WHERE
    university = 'Cazenovia College'
    AND `Grad.Rate` > 100;
    
DELETE FROM student_data
WHERE
    university = 'Cazenovia College'
    AND `Grad.Rate` > 100
    AND id = 83;

SELECT
    university,
    COUNT(*)
FROM student_data
GROUP BY university
HAVING COUNT(*) > 1;


SELECT 
	university,
   `Grad.Rate`
FROM student_data;

SELECT 
	university,
    `Grad.Rate`
FROM student_data
WHERE
	`Grad.Rate`>=90 
ORDER BY 
	`Grad.Rate` DESC;

SELECT 
	university,
    `Grad.Rate`
FROM student_data
WHERE
	`Grad.Rate`<=20 
ORDER BY 
	`Grad.Rate` ;

SELECT
	university,
    Private,
    `Grad.Rate`,
    Apps
FROM student_data
WHERE 
	Private = 'No' AND `Grad.Rate` >=50
ORDER BY
	`Grad.Rate` DESC
LIMIT 10; 

SELECT 
	university,
    Outstate,
    `Room.Board`,
    Books,
    Personal,
    Outstate + `Room.Board` + Books + Personal as total_cost
FROM student_data
ORDER BY
	total_cost DESC
LIMIT 10 ;

SELECT 
	AVG(Outstate) as outstate_avg,
	MIN(Outstate) as outstate_min,
	MAX(Outstate) as outstate_max
FROM student_data;

SELECT
    Private,
    AVG(`Grad.Rate`) AS avg_grad_rate
FROM
    student_data
WHERE
    `PhD` > 85
GROUP BY
    Private
HAVING
    AVG(`Grad.Rate`) > 70;
    

SELECT COUNT(*) AS high_grad_rate
FROM student_data
WHERE `Grad.Rate` > 80;



SELECT 
	Private,
	COUNT(*) AS count
FROM student_data
GROUP BY Private;

SELECT
    COUNT(CASE WHEN `Grad.Rate` < 50 THEN 1 END) AS low_rate,
    COUNT(CASE WHEN `Grad.Rate` BETWEEN 50 AND 80 THEN 1 END) AS medium_rate,
    COUNT(CASE WHEN `Grad.Rate` > 80 THEN 1 END) AS high_rate
FROM student_data;










