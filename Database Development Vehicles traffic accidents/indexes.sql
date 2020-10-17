create index dateBtree  on db2_accident_information using btree(date) ;
create index urban_or_rural_areaHash  on db2_accident_information using hash(urban_or_rural_area) ;
create index age_band_of_driverHash  on db2_vehicle_information using hash(age_band_of_driver) ;