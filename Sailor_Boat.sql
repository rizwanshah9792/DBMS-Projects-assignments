Create database SailorBoat;

use SailorBoat;

Create table Sailors (
sid int primary key,
sname varchar(15),
rating int,
age real 
);

Create table Boats (
bid int primary key,
bname varchar(15), 
color varchar(10)
);

Create table Reserves (
sid int,
bid int,
day date,
primary key(sid, bid, day),
foreign key (sid) references Sailors(sid),
foreign key (bid) references Boats(bid)
);

Insert into Sailors (sid, sname, rating, age)
values
(22, 'Dustin', 7, 45),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 10, 16),
(74, 'Horatio', 9, 40),
(85, 'Art', 3, 35.5),
(95, 'Bob', 3, 63.5);

Insert into Boats (bid, bname, color)
Values
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');

Insert into Reserves (sid, bid, day)
values
(22, 101, '1998-10-10'),
(22, 102, '1998-10-10'),
(22, 103, '1998-10-8'),
(22, 104, '1998-10-7'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-6'),
(31, 104, '1998-11-12'),
(64, 101, '1998-9-5'),
(64, 102, '1998-9-8'),
(74, 103, '1998-9-8');


-- 1. Find all sailors with rating above 7.
select Sailors.sname
from Sailors
where rating > 7;

-- 2. Find name and ages of all sailors.
select Sailors.sname, Sailors.age
from Sailors;

-- 3. Find the name of sailors who have reserves the boat no. 103
select Sailors.sname
from Sailors
join Reserves on Sailors.sid = Reserves.sid
where bid = 103;

-- 4. Find the Sailors Id of Sailors who has reserve a red boat
select distinct Sailors.sid
from Sailors
join Reserves on Sailors.sid = Reserves.sid
where Reserves.bid in (
	select Boats.bid 
	from Boats 
    join Reserves on Boats.bid = Reserves.bid 
    where color = 'red'
);

-- 5. Find the color of boat Resereve by 'Lubber'.
select distinct Boats.color
from Boats
join Reserves on Boats.bid = Reserves.bid
where Reserves.sid in (
	select Sailors.sid
    from Sailors
    where sname = 'Lubber'
);

-- 6. Find the names of Sailors who have reserve at least one boat.
select sname
from Sailors
where sid in (select distinct sid from Reserves);

-- 7. Find the ages of Sailors whose name begins and ends with 'B' eg. 'Bob' and has at least 3 character.
select Sailors.age
from Sailors
where sname like "B%b" and length(sname) >= 3;

-- 8. Find the name of Sailors who have reserved 'red' or 'green' boat.
select distinct s.sid, s.sname
from Sailors s
join Reserves r on s.sid = r.sid
join Boats b on b.bid = r.bid
where b.color = 'red' or b.color = 'green';

-- 9. Find the Sailor id of all sailor who reversed red boat but not green boats.
select distinct s.sid
from Sailors s
where s.sid in (
	select r.sid
    from Reserves r
    join Boats b on b.bid = r.bid
    where b.color = 'red'
)
and s.sid not in (
	select r.sid
    from Reserves r
    join Boats b on b.bid = r.bid
    where b.color = 'green'
);

-- 10. Find the set of Sailors who have reserved red boat AND the set of set of sailor who have reserved green boats.
select distinct s.sid, s.sname
from Sailors s
join Reserves r on s.sid = r.sid
join Boats b on b.bid = r.bid
where b.color = 'red'

union

select distinct s.sid, s.sname
from Sailors s
join Reserves r on s.sid = r.sid
join Boats b on b.bid = r.bid
where b.color = 'green';



-- 11. Find the Sailor id of sailor who have rating of 10 or have reserved boat no. 104
SeLeCt distinct s.sid
fRoM Sailors s
LeFt JoIn Reserves r oN s.sid = r.sid
where s.rating = 10 oR r.bid = 104;

-- 12. Find the name of Sailor who have reserved boat no. 103.
SeLeCt s.sname
FrOm Sailors s
JoIn Reserves r oN s.sid = r.sid
WhErE r.bid = 103;

-- 13. Find the name of Sailor who have reserved a red boat (IN).
sElEcT distinct s.sid, s.sname
fRoM Sailors s
jOiN Reserves r oN s.sid = r.sid
jOiN Boats b oN r.bid = b.bid
wHeRe b.color = 'red';

-- 14. Find the name of Sailor who have not reserved a red boat (NOT IN).alter
select distinct s.sid, s.sname
from sailors s
where s.sid not in (
	select r.sid
    from Reserves r
    join Boats b on r.bid = b.bid
    where b.color = 'red'
);

-- 15. Find the name of Sailors who have reserved boat no. 103 (EXITS).
select s.sname
from Sailors s
where exists (
	select 1
    from Reserves r
    where r.sid = s.sid and r.bid = 103
);