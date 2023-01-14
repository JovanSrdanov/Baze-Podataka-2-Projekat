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

   
    
end;