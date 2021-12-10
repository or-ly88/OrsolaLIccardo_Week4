--Esercitazione Orsola Liccardo SQL 10/12/2021
/*risposte 
1)c
2)Se l’associazione è N a N, si aggiunge una terza tabella, che contiene le chiavi 
delle altre due tabelle (ed eventuali attributi riferiti a quella relazione)

3)b:DML
4)a
5)b
*/


Create database NegozioDiDischi

create table Band(
idBand int primary key identity(1,1),
nome varchar(50) not null,
numeroDiComponenti int not null);

--inserisco record alla tabella band
insert into Band values('883','5'),
                       ('neri per caso','5')

--per visualizzare il contenuto della table
select * 
from Band

create table Album(
idAlbum int primary key identity (1,1),
titolo varchar (50)not null,
annoDiUscita int,
casaDiscografica varchar(50) not null ,
genere varchar(50) not null ,
supportoDiDistribuzione varchar(50) not null,
idBand int foreign key references Band(idBand));


create table Brano(
idBrano int primary key identity(1,1),
titolo varchar(50) not null,
durata int);

create table AlbumBrano(
idAlbum int not null foreign key references Album(idAlbum),
idBrano int not null foreign key references Brano(idBrano),
constraint PK_ALBUMBRANO primary key (idAlbum,idBrano));




--Vincoli unique
alter table Album
Add Constraint UC_Album unique(titolo,annoDiUscita,casaDiscografica,genere,supportoDiDistribuzione)

--Realizzare le seguenti query:

--1)scrivere una query che restituisca i titoli degli album degli 883 in ordine alfabetico
insert into Album values ('hanno ucciso l"uomo ragno','1992','sony','pop','cd','1'),
                          ('La dura legge del gol','1997','sony','pop','cd','1'),
						  ('nord sud ovest est','1993','sony','pop','cd','1')
						

select titolo
from Album
order by titolo

--2)selezionare tutti gli album della casa discografica 'sony music' relativi all'anno 2020
 insert into Album values  ('883 reunion','2020','sony','pop','cd','1'),
                           ('883 rimasterizzato','2020','sony','pop','cd','1')


select  *
from Album 
where Album.casaDiscografica like 'sony'
and Album.annoDiUscita=2020



--3)scrivere una query che restituisca tutti i titoli delle canzoni dei Maneskin 
--appartenenti ad album pubblicati nel 2019

insert into Brano values('chosen','120'),
                        ('torna a casa','122');
insert into Brano values ('mammamia','180')

insert into Band values ('Maneskin','4')

insert into Album values('Il ballo delle vita','2018','sony','rock','cd','3')
insert into Album values ('Il ballo della vita Vol.1','2018','sony','rock','cd','3')

select *
from Album
select *
from Brano

insert into AlbumBrano values (6,1),
                              (9,5)
                               

select b.titolo
from Brano b join AlbumBrano ab on b.idBrano=ab.idBrano
             join Album a on a.idAlbum=ab.idAlbum
			 join Band ba on ba.idBAnd=a.idBand

where ba.nome='Maneskin' and a.annoDiUscita<2019



--4)individuare tutti gli album in cui è contenuto la canzone 'imagine'
insert into Band values ('Beatles','4')
insert into Brano values ('imagine','130')



select a.*
from Album a join Brano b on b.idBrano=a.idAlbum
where b.Titolo='Imagine';



--5)restituire il numero totale di canzoni eseguite dalla band 'The giornalisti'
insert into Band values ('The giornalisti','5')

insert Brano values('Riccione','100'),
                   ('questa nostra stupida canzone','120')




insert into Album values ('Riccione','2018','sony','pop','cd','4'),
                         ('questa nostra stupida canzone','2018','sony','pop','cd','4')



select count (ba.nome) as [Numero totale delle canzoni dei The Giornalisti]
from Brano b join AlbumBrano ab on b.idBrano=ab.idBrano
             join Album a on ab.idAlbum=a.idAlbum
			 join Band ba on ba.idBand=a.idBand
where ba.nome='The Giornalisti'
group by ba.nome

--6)contare per ogni album, la "durata totale" cioè la somma dei secondi dei suoi brani

select a.titolo, sum(b.durata) as durataTotaleAlbum
from Brano b
join AlbumBrano ab on ab.idBrano=b.idBrano
join Album a on a.idAlbum=ab.idAlbum
group by a.titolo

--7)Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i 
--secondi quindi 180 s)
               

                        









