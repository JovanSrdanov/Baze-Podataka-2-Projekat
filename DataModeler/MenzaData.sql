BEGIN
  FOR c IN (SELECT table_name, constraint_name FROM user_constraints WHERE constraint_type = 'R')
  LOOP
    EXECUTE IMMEDIATE ('alter table ' || c.table_name || ' disable constraint ' || c.constraint_name);
  END LOOP;
  FOR c IN (SELECT table_name FROM user_tables)
  LOOP
    EXECUTE IMMEDIATE ('truncate table ' || c.table_name);
  END LOOP;
  FOR c IN (SELECT table_name, constraint_name FROM user_constraints WHERE constraint_type = 'R')
  LOOP
    EXECUTE IMMEDIATE ('alter table ' || c.table_name || ' enable constraint ' || c.constraint_name);
  END LOOP;
  
    INSERT INTO drzava VALUES (1,'Srbija','381');
    INSERT INTO drzava VALUES (2,'Hrvatska','281');
    INSERT INTO drzava VALUES (3,'Makedonija','481');
    INSERT INTO drzava VALUES (4,'Ku2322ba','111');
    INSERT INTO drzava VALUES (5,'Kinsada','231');
    INSERT INTO drzava VALUES (6,'ffsSrbija','381');
    INSERT INTO drzava VALUES (7,'Hrsdsvatska','281');
    INSERT INTO drzava VALUES (8,'Masdsskedonija','481');
    INSERT INTO drzava VALUES (9,'Kubaaaa','111');
    INSERT INTO drzava VALUES (10,'Kinaaa23232a','231');
    
    insert into grad values (1,'Zrenjanin','023',1);
    insert into grad values (2,'Kikinda','1032323',1);
    insert into grad values (3,'Novi Sad','2023',1);
    insert into grad values (4,'Beograd','223',1);
    insert into grad values (5,'New Haven','022',3);
    insert into grad values (6,'Zrenjanin','023',2);
    insert into grad values (7,'Kikinda','1032323',3);
    insert into grad values (8,'Novi Sad','2023',4);
    insert into grad values (9,'Beograd','223',4);
    insert into grad values (10,'New Haven','022',1);
    
END;



