create table db2_Accident_Information(
empty integer,
Accident_Index varchar(255),
First_Road_Class varchar(255),
Accident_Severity varchar(255),
Date date,
Urban_or_Rural_Area varchar(255),
Weather_Conditions varchar(255),
Year integer,
InScotland varchar(255),
primary key(Accident_Index)
);
 
copy db2_Accident_Information from 'D:\db2_Accident_Information.csv' Delimiter ',' CSV HEADER;

create table db2_Vehicle_Information(
empty integer,
Accident_Index varchar(255),
Age_Band_of_Driver varchar(255),
Age_of_Vehicle varchar(255),
make varchar(255),
model varchar(255),
Sex_of_Driver varchar(255),
Vehicle_Type varchar(255) 
);
 
copy db2_Vehicle_Information from 'D:\db2_Vehicle_Information.csv' Delimiter ',' CSV HEADER encoding 'windows-1251';

