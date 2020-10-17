select count(db2_accident_information.accident_index) as RuralAccidents_Year2012_agebetween3645
from db2_accident_information
inner join db2_Vehicle_Information
on db2_accident_information.accident_index=db2_Vehicle_Information.accident_index
where db2_accident_information.urban_or_rural_area='Rural' and db2_accident_information.date>'2012/1/1'  and db2_accident_information.date<'2012/12/31' and db2_Vehicle_Information.age_band_of_driver='36 - 45'