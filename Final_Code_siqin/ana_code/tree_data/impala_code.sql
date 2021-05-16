--Part 1. CREATE TABLE

--Create the table.
drop table if exists tree;
create table tree(
	tree_id int,
	tree_status string,
	tree_healthy string,
	borough string,
	tree_species string)
row format delimited
fields terminated by ',';

--Load the data into the table.
load data inpath 'hdfs://horton.hpc.nyu.edu:8020/user/ss12083/project_data/Cleaned_Dataset' overwrite into table tree;

--Check if data is loaded successfully.
select * 
from tree;


--Part 2. Show basic stats

--Show the borough counts.
select borough, count(borough)
from tree
group by borough
order by count(borough) desc;

--Show tree_species counts.
select tree_species, count(tree_species)
from tree
group by tree_species
order by count(tree_species) desc;

--Show tree_status counts.
select tree_status, count(tree_status)
from tree
group by tree_status
order by count(tree_status) desc;

--Show tree_health counts.
select tree_healthy, count(tree_healthy)
from tree
group by tree_healthy
order by count(tree_healthy) desc;


--Part 3. Show stats for each borough, with respect to tree_status, tree_healthy, and tree_species.

--Tree_status

--Bronx
select tree_status, count(tree_status)
from tree
where borough = " Bronx"
group by tree_status
order by count(tree_status) desc;
--Brooklyn
select tree_status, count(tree_status)
from tree
where borough = " Brooklyn"
group by tree_status
order by count(tree_status) desc;
--Queens
select tree_status, count(tree_status)
from tree
where borough = " Queens"
group by tree_status
order by count(tree_status) desc;
--Staten Island
select tree_status, count(tree_status)
from tree
where borough = " Staten Island"
group by tree_status
order by count(tree_status) desc;
--Manhattan
select tree_status, count(tree_status)
from tree
where borough = " Manhattan"
group by tree_status
order by count(tree_status) desc;

--Tree_health

--Bronx
select tree_healthy, count(tree_healthy)
from tree
where borough = " Bronx"
group by tree_healthy
order by count(tree_healthy) desc;
--Brooklyn
select tree_healthy, count(tree_healthy)
from tree
where borough = " Brooklyn"
group by tree_healthy
order by count(tree_healthy) desc;
--Queens
select tree_healthy, count(tree_healthy)
from tree
where borough = " Queens"
group by tree_healthy
order by count(tree_healthy) desc;
--Staten Island
select tree_healthy, count(tree_healthy)
from tree
where borough = " Staten Island"
group by tree_healthy
order by count(tree_healthy) desc;
--Manhattan
select tree_healthy, count(tree_healthy)
from tree
where borough = " Manhattan"
group by tree_healthy
order by count(tree_healthy) desc;


--Tree_species

--Bronx
select tree_species, count(tree_species)
from tree
where borough = " Bronx"
group by tree_species
order by count(tree_species) desc;
--Brooklyn
select tree_species, count(tree_species)
from tree
where borough = " Brooklyn"
group by tree_species
order by count(tree_species) desc;
--Queens
select tree_species, count(tree_species)
from tree
where borough = " Queens"
group by tree_species
order by count(tree_species) desc;
--Staten Island
select tree_species, count(tree_species)
from tree
where borough = " Staten Island"
group by tree_species
order by count(tree_species) desc;
--Manhattan
select tree_species, count(tree_species)
from tree
where borough = " Manhattan"
group by tree_species
order by count(tree_species) desc;













