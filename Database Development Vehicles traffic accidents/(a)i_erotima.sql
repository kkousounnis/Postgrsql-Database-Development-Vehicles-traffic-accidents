select first_road_class,count(accident_index) as Accidents_by_road_class
from db2_accident_information
group by first_road_class 