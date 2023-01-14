begin
  for c in (select table_name, constraint_name from user_constraints where constraint_type = 'R')
  loop
    execute immediate ('alter table ' || c.table_name || ' disable constraint ' || c.constraint_name);
  end loop;
  for c in (select table_name from user_tables)
  loop
    execute immediate ('truncate table ' || c.table_name);
  end loop;
  for c in (select table_name, constraint_name from user_constraints where constraint_type = 'R')
  loop
    execute immediate ('alter table ' || c.table_name || ' enable constraint ' || c.constraint_name);
  end loop;
  
	-- Drzave
    insert into drzava values (1,'Srbija','381');
    insert into drzava values (2,'Hrvatska','281');
    insert into drzava values (3,'Makedonija','481');
    insert into drzava values (4,'Kuba','111');
    insert into drzava values (5,'Australija','231');
    insert into drzava values (6,'Rusija','381');
    insert into drzava values (7,'Ukrajna','281');
    insert into drzava values (8,'Kanada','481');
    insert into drzava values (9,'Japan','111');
    insert into drzava values (10,'Indija','231');
    
	-- Gradovi
    insert into grad values (1,'Zrenjanin','023',1);
    insert into grad values (2,'Kikinda','1032323',1);
    insert into grad values (3,'Novi Sad','2023',1);
    insert into grad values (4,'Beograd','223',1);
    insert into grad values (5,'New York','022',3);
    insert into grad values (6,'Berlin','023',2);
    insert into grad values (7,'Novi Pazar','1032323',3);
    insert into grad values (8,'Kraljevo','2023',4);
    insert into grad values (9,'Los Angeles','223',4);
    insert into grad values (10,'London','022',1);
	
	-- Adrese    
    insert into adresa values (1,'Novosadska','123b',1,1);
    insert into adresa values (2,'Beogradska','9231',2,1);
    insert into adresa values (3,'Zrenjaninska','1223b',3,1);
    insert into adresa values (4,'Planinska','3123b',4,1);
    insert into adresa values (5,'Strazilovska','1423c',5,3);
    insert into adresa values (6,'Peta','1273b',6,2);
    insert into adresa values (7,'Kraljevska','1231b',7,3);
    insert into adresa values (8,'Cara Lazara','1223b',8,4);
    insert into adresa values (9,'Oslobodjenja','3123a',9,4);
    insert into adresa values (10,'Futoska','1423b',10,1);
	
	-- Univerziteti
	insert into univerzitet values (1,'UNS');
	insert into univerzitet values (2,'UBG');
	insert into univerzitet values (3,'UNI');
	insert into univerzitet values (4,'UZR');
	insert into univerzitet values (5,'UKG');
	insert into univerzitet values (6,'USA');
	insert into univerzitet values (7,'UKI');
	insert into univerzitet values (8,'UZA');
	insert into univerzitet values (9,'UUZ');
	insert into univerzitet values (10,'UNV');
	
	-- Fakulteti
	insert into fakultet values (1,'FTN',1,1);
	insert into fakultet values (2,'Pravni',2,1);
	insert into fakultet values (3,'Poljoprivredni',3,1);
	insert into fakultet values (4,'Tehnoloski',4,1);
	insert into fakultet values (5,'Medicinski',5,1);
	insert into fakultet values (6,'Filozofski',6,2);
	insert into fakultet values (7,'Ekonomski',7,2);
	insert into fakultet values (8,'Gradjevinski',8,2);
	insert into fakultet values (9,'Akademija umetnosti',9,3);
	insert into fakultet values (10,'Hemijski',10,4);
	
	-- Tipovi kuvara
	insert into tipkuvara values (1,'Vegetarijanski');
	insert into tipkuvara values (2,'Posni');
	insert into tipkuvara values (3,'Profesionalni');
	insert into tipkuvara values (4,'Pocetnicki');
	insert into tipkuvara values (5,'Vanredni');
	insert into tipkuvara values (6,'Pekar');
	insert into tipkuvara values (7,'Dezertni kuvar');
	insert into tipkuvara values (8,'Novi kuvar');
	insert into tipkuvara values (9,'Vrsni');
	insert into tipkuvara values (10,'Riblji');
	
	-- Hrane
    insert into hrana values (1,'Junetina',333);
	insert into hrana values (2,'Svinjetina',323);
	insert into hrana values (3,'Kupus',33);
	insert into hrana values (4,'Krastavci',123);
    insert into hrana values (5,'Makarone',453);
	insert into hrana values (6,'Spagete',663);
	insert into hrana values (7,'Cufte',666);
	insert into hrana values (8,'Batkovi',777);
	insert into hrana values (9,'Grasak',345);
	insert into hrana values (10,'Pasulj',762);
    
    -- Dostavljaci hrane
    insert into dostavljachrane values (1,'Gomex meso');
	insert into dostavljachrane values (2,'Mileticevi');
	insert into dostavljachrane values (3,'Srdjan i sinovi');
	insert into dostavljachrane values (4,'Baba Ivka');
	insert into dostavljachrane values (5,'Lidl povrce');
    insert into dostavljachrane values (6,'Nemanjici');
	insert into dostavljachrane values (7,'Karadjordjevici');
	insert into dostavljachrane values (8,'Prodaja mesa BG');
	insert into dostavljachrane values (9,'Somborska mlekara');
	insert into dostavljachrane values (10,'Biser');
	
	-- Restorani
	insert into restoran values (1,'NANA HRANA',100,1);
	insert into restoran values (2,'Papricica',100,2);
	insert into restoran values (3,'Kod jefte',100,3);
	insert into restoran values (4,'Restoran 4',100,4);
	insert into restoran values (5,'Restoran 5',100,5);
	insert into restoran values (6,'Tocionica',100,6);
	insert into restoran values (7,'Mekdonalds',100,7);
	insert into restoran values (8,'Tortilja kasa',100,8);
	insert into restoran values (9,'KFC',100,9);
	insert into restoran values (10,'Dva stapica',100,10);
	
	-- Studenti
	insert into student values (1,'Jovan','Srdanov','1236667653823','1-NOV-2000',1,'RA 145 2019',1);
	insert into student values (2,'Jovana','Tot','1236667653823','5-NOV-2000',1,'RA 125 2019',1);
	insert into student values (3,'Mihaela','Holjevac','1236667653823','6-NOV-2000',1,'RA 611 2019',10);
	insert into student values (4,'Ivan','Milin','1236667653823','1-NOV-2000',1,'RA 14 2019',1);
	insert into student values (5,'Strahinja','Erakovic','1236667653823','1-NOV-1999',1,'RA 145 2018',10);
	insert into student values (6,'Biljana','Popov','1236667653823','1-NOV-2000',1,'RA 25 2019',2);
	insert into student values (7,'Dragoslava','Kovacevic','1236667653823','1-NOV-2000',1,'RA 5 2019',4);
	insert into student values (8,'Gordana','Karavidin','1236667653823','1-NOV-2000',1,'RA 143 2019',5);
	insert into student values (9,'Bojana','Nikolin','1236667653823','3-NOV-2000',1,'RA 112 2019',6);
	insert into student values (10,'Dana','Luburic','1236667653823','1-NOV-2000',1,'RA 1 2019',10);
	
	-- Studentske kartice
	insert into studentskakartica values (1,13,1,1,6233,'1-NOV-2018','1-NOV-2019',1);
	insert into studentskakartica values (2,1,13,1,2363,'1-NOV-2017','1-NOV-2018',2);
	insert into studentskakartica values (3,13,13,1,2633,'1-NOV-2017','1-NOV-2018',3);
	insert into studentskakartica values (4,1,1,31,6233,'1-NOV-2017','1-NOV-2018',4);
	insert into studentskakartica values (5,13,1,1,663,'1-NOV-2018','1-NOV-2019',5);
	insert into studentskakartica values (6,1,1,31,63,'1-NOV-2018','1-NOV-2019',6);
	insert into studentskakartica values (7,13,61,31,903,'1-NOV-2022','1-NOV-2023',7);
	insert into studentskakartica values (8,16,16,1,2333,'1-NOV-2018','1-NOV-2019',8);
	insert into studentskakartica values (9,16,1,1,213,'1-NOV-2018','1-NOV-2019',9);
	insert into studentskakartica values (10,16,16,16,11,'1-NOV-2018','1-NOV-2019',10);
	
	-- Portiri
	insert into portir values (1,'Una','Markov','1236667153823','1-NOV-2000',1,'176538',1);
	insert into portir values (2,'Dina','Vidakovic','1226667653823','5-NOV-2000',1,'576538',1);
	insert into portir values (3,'Aleksandar','Stojanov','3236667653823','6-NOV-2000',1,'765538',1);
	insert into portir values (4,'Stefan','Bajat','4236667653823','1-NOV-2000',1,'765338',1);
	insert into portir values (5,'Jana','Djuras','5236667653823','1-NOV-1999',1,'765318',1);
	insert into portir values (6,'Valerija','Sporin','6236667653823','1-NOV-2000',1,'765383',2);
	insert into portir values (7,'Aurora','Novakovic','7236667653823','1-NOV-2000',1,'1276538',4);
	insert into portir values (8,'Vuk','Kaludjerski','8236667653823','1-NOV-2000',1,'555',5);
	insert into portir values (9,'Tomas','Stefanov','9236667653823','3-NOV-2000',1,'5354',6);
	insert into portir values (10,'Helena','Cvetkov','9136667653823','1-NOV-2000',1,'145116',10);
	
	-- Kuvari
	insert into kuvar values (1,'Petar','Tot','1236667153823','1-NOV-2000',1,176538,1,NULL,1);
	insert into kuvar values (2,'Danilo','Koriz','1226667653823','5-NOV-2000',1,576538,2,1,1);
	insert into kuvar values (3,'Stojan','Stojanovic','3236667653823','6-NOV-2000',1,765538,3,2,1);
	insert into kuvar values (4,'Nemanja','Klipa','4236667653823','1-NOV-2000',1,765338,4,1,1);
	insert into kuvar values (5,'Dragan','Zaric','5236667653823','1-NOV-1999',1,76531,5,1,1);
	insert into kuvar values (6,'Sofija','Sporin','6236667653823','1-NOV-2000',1,765383,6,1,1);
	insert into kuvar values (7,'Iva','Novakovic','7236667653823','1-NOV-2000',1,1276538,7,1,1);
	insert into kuvar values (8,'Eva','Kaludjerski','8236667653823','1-NOV-2000',1,555,8,1,1);
	insert into kuvar values (9,'Mia','Stefanov','9236667653823','3-NOV-2000',1,535,9,NULL,2);
	insert into kuvar values (10,'Dunja','Cvetkov','9136667653823','1-NOV-2000',1,145116,10,NULL,2);
	
	-- Menadzeri
	insert into menadzer values (1,'Ana','Markov','1236667153823','1-NOV-2000',1,'da@gmail.com');
	insert into menadzer values (2,'Vesna','Vidakovic','1226667653823','5-NOV-2000',1,'da1@gmail.com');
	insert into menadzer values (3,'Sava','Stojanov','3236667653823','6-NOV-2000',1,'d23a@gmail.com');
	insert into menadzer values (4,'Dusan','Bajat','4236667653823','1-NOV-2000',1,'d232a@gmail.com');
	insert into menadzer values (5,'Vladimir','Djuras','5236667653823','1-NOV-1999',1,'da13@gmail.com');
	insert into menadzer values (6,'Marijana','Sporin','6236667653823','1-NOV-2000',1,'adsda@gmail.com');
	insert into menadzer values (7,'Mateja','Novakovic','7236667653823','1-NOV-2000',1,'sadda@gmail.com');
	insert into menadzer values (8,'Bogdan','Kaludjerski','8236667653823','1-NOV-2000',1,'ddda@gmail.com');
	insert into menadzer values (9,'Sara','Stefanov','9236667653823','3-NOV-2000',1,'123da@gmail.com');
	insert into menadzer values (10,'Milica','Cvetkov','9136667653823','1-NOV-2000',1,'zzzda@gmail.com');
	
	-- Upravlja
	insert into upravlja values (1,1);
	insert into upravlja values (2,2);
	insert into upravlja values (3,3);
	insert into upravlja values (4,4);
	insert into upravlja values (5,5);
	insert into upravlja values (6,6);
	insert into upravlja values (7,7);
	insert into upravlja values (8,7);
	insert into upravlja values (9,7);
	insert into upravlja values (6,10);
	
	--Narudzbina
	
	insert into narudzbina values (1,'1-NOV-2023',1,2,2);
	insert into narudzbina values (2,'2-NOV-2023',1,3,3);
	insert into narudzbina values (3,'3-NOV-2023',3,2,2);
	insert into narudzbina values (4,'4-NOV-2023',5,2,2);
	insert into narudzbina values (5,'5-DEC-2023',2,2,2);
	insert into narudzbina values (6,'2-MAR-2023',2,2,2);
	insert into narudzbina values (7,'13-NOV-2023',8,6,10);
	insert into narudzbina values (8,'14-NOV-2023',2,2,2);
	insert into narudzbina values (9,'21-NOV-2023',3,2,2);
	insert into narudzbina values (10,'17-NOV-2023',9,2,2);
	
	--Hrana u narudzbini
	insert into hranaunar values(1,1);
	insert into hranaunar values(1,2);
	insert into hranaunar values(1,3);
	insert into hranaunar values(1,4);
	insert into hranaunar values(1,5);
	insert into hranaunar values(2,1);
	insert into hranaunar values(3,2);
	insert into hranaunar values(4,3);
	insert into hranaunar values(5,4);
	insert into hranaunar values(6,5);

end;