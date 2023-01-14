-- Broj studenata po univerzitetu
create or replace view 
ComplicatedQuerry ( NazUni, BrojStud) As 
select u.nazuni, count(s.idosb)
from fakultet f, univerzitet u, student s
where f.univerzitet_iduni = u.iduni and s.fakultet_idfak= f.idfak
group by u.nazuni
having count(s.idosb)>=2;
