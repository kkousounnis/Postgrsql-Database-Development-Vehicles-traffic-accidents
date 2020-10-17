select count(db2_accident_information.accident_index) as UrbanAccidents_less2010_1_1_agebetween2635
from db2_accident_information
inner join db2_Vehicle_Information
on db2_accident_information.accident_index=db2_Vehicle_Information.accident_index
where db2_accident_information.urban_or_rural_area='Urban' and db2_accident_information.date<'2010/1/1' and db2_Vehicle_Information.age_band_of_driver='26 - 35'