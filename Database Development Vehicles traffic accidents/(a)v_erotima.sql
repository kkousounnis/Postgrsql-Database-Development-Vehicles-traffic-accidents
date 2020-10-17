select db2_vehicle_information.make as manufacturer,count(db2_vehicle_information.make) maxAccidents
from db2_vehicle_information
inner join db2_accident_information
on db2_vehicle_information.accident_index=db2_accident_information.accident_index
where db2_accident_information.date>='2010/1/1' and db2_accident_information.date<='2012/12/31' and db2_vehicle_information.Age_Band_of_Driver='26 - 35' and db2_accident_information.first_road_class='A'
group by db2_vehicle_information.make
having count(db2_vehicle_information.make)=(
select max(count)
from(select db2_vehicle_information.make as manufacturer,count(db2_vehicle_information.make)as count
from  db2_vehicle_information
inner join db2_accident_information
on db2_vehicle_information.accident_index=db2_accident_information.accident_index
where db2_accident_information.date>='2010/1/1' and db2_accident_information.date<='2012/12/31' and db2_vehicle_information.Age_Band_of_Driver='26 - 35' and db2_accident_information.first_road_class='A'
group by manufacturer) as manufacturertype);


--briskw  tous kataskeyastes kai posa atuximata exoun kanei kai sthn synxeia bazw to iso(having count(db2_vehicle_information.make)=)
--gia na brw to megisto apo aytous toys ari8mous pou to briskw me to na ksana dimourghsw ton idio pinaka katasekeyastes kai posa atyximata gia na brw panw se ayton ton
--pinaka poio einai to megisto mias kai se agrregetion den se afinei na emfaniseis alles stiles an den tis omadopoihseis dhldah ebriska to megisto alla emfanize mono ton ari8mo 
--mono toy kai oxi ton kataskeuasti opote me bash to max poy exw briskw mesa apo thn sthlh count poy exw brei sthn arxh to megisto me tin isotita kai emfanizw apo dipla tou ton kataskeuasth