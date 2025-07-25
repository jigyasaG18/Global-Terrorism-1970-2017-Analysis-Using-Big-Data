// Hive Table Creation 

CREATE DATABASE IF NOT EXISTS terrorism_db; 
USE terrorism_db; 
CREATE EXTERNAL TABLE global_attacks ( 
eventid STRING, 
iyear INT, 
imonth INT, 
iday INT, 
country_txt STRING, 
region_txt STRING, 
provstate STRING, 
city STRING, 
success INT, 
attacktype1_txt STRING, 
targtype1_txt STRING, 
targsubtype1_txt STRING, 
weaptype1_txt STRING, 
gname STRING, 
nkill INT, 
nwound INT, 
nkillter INT, 
summary STRING 
) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE 
TBLPROPERTIES ("skip.header.line.count"="1") 
LOCATION '/user/terror/global_attacks'; 


// Key Hive Queries Used -- Total Attacks by Year 

SELECT iyear, COUNT(*) AS total_attacks  
FROM global_attacks  
GROUP BY iyear  
ORDER BY iyear; -- Top 10 Terrorist Groups 
SELECT gname, COUNT(*) AS total_attacks  
FROM global_attacks  
GROUP BY gname  
ORDER BY total_attacks DESC  
LIMIT 10; 

// Most Common Weapon Types 

SELECT weaptype1_txt, COUNT(*)  
FROM global_attacks  
GROUP BY weaptype1_txt  
ORDER BY COUNT(*) DESC; 

//Attack Distribution by Region 

SELECT region_txt, COUNT(*)  
FROM global_attacks  
GROUP BY region_txt; 

//Civilian Target Attacks 

SELECT targtype1_txt, COUNT(*)  
FROM global_attacks  
WHERE targtype1_txt = 'Private Citizens & Property' 
GROUP BY targtype1_txt; 

//Hive Table Creation 

CREATE DATABASE IF NOT EXISTS terrorism_db; 
USE terrorism_db; 
CREATE EXTERNAL TABLE global_attacks ( 
eventid STRING, 
iyear INT, 
imonth INT, 
iday INT, 
country_txt STRING, 
region_txt STRING, 
provstate STRING, 
city STRING, 
success INT, 
attacktype1_txt STRING, 
targtype1_txt STRING, 
targsubtype1_txt STRING, 
weaptype1_txt STRING, 
gname STRING, 
nkill INT, 
nwound INT, 
nkillter INT, 
summary STRING 
) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE 
TBLPROPERTIES ("skip.header.line.count"="1") 
LOCATION '/user/terror/global_attacks'; 

//Key Hive Queries Used 

//Total Attacks by Year 

SELECT iyear, COUNT(*) AS total_attacks  
FROM global_attacks  
GROUP BY iyear  
ORDER BY iyear; 
//Top 10 Terrorist Groups 

SELECT gname, COUNT(*) AS total_attacks  
FROM global_attacks  
GROUP BY gname  
ORDER BY total_attacks DESC  
LIMIT 10; 

//Most Common Weapon Types 

SELECT weaptype1_txt, COUNT(*)  
FROM global_attacks  
GROUP BY weaptype1_txt  
ORDER BY COUNT(*) DESC; 

//Attack Distribution by Region 

SELECT region_txt, COUNT(*)  
FROM global_attacks  
GROUP BY region_txt; 

//Civilian Target Attacks 

SELECT targtype1_txt, COUNT(*)  
FROM global_attacks  
WHERE targtype1_txt = 'Private Citizens & Property' 
GROUP BY targtype1_txt; 
