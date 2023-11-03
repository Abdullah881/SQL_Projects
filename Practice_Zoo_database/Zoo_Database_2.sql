

if exists (SELECT 1 from INFORMATION_SCHEMA.TABLES tbl_species)
    drop Table tbl_species, tbl_animalia, tbl_care, tbl_class, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;

CREATE TABLE tbl_animalia (
    animalia_id INT PRIMARY KEY not NULL IDENTITY (0,1),
    animalia_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_class (
    class_id INT PRIMARY KEY not NULL IDENTITY (100,1),
    class_type VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_order (
    order_id INT PRIMARY KEY not NULL IDENTITY (1,1),
    order_type VARCHAR(50) not NULL
);

CREATE TABLE tbl_care (
    care_id VARCHAR(50) PRIMARY KEY not NULL,
    care_type VARCHAR(50) NOT NULL,
    care_specialist int not null
);

CREATE table tbl_nutrition (
    nutrition_id INT PRIMARY KEY not NULL IDENTITY (2200,1),
    nutrition_type VARCHAR(50) NOT NULL ,
    nutrition_cost Money not NULL
);

CREATE TABLE tbl_habitat (
    habitat_id INT PRIMARY KEY not NULL IDENTITY (5000,1),
    habitat_type VARCHAR (50) not null,
    habitat_cost VARCHAR(50) not NULL
);

create table tbl_specialist(
    specialist_id INT PRIMARY KEY not NULL IDENTITY (1,1),
    specialist_fname VARCHAR(50) not NULL,
    specialist_lname VARCHAR(50) not NULL,
    specialist_contact VARCHAR(50) not NULL
);

CREATE TABLE tbl_species (
    species_id INT PRIMARY KEY not NULL IDENTITY (1,1),
    species_name VARCHAR(50) not null,
    species_animalia int not null CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) on UPDATE CASCADE ON DELETE CASCADE,
    species_class int not null CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) on UPDATE CASCADE ON DELETE CASCADE,
    species_order int not null CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) on UPDATE CASCADE ON DELETE CASCADE,
    species_habitat int not null CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) on UPDATE CASCADE ON DELETE CASCADE,
    species_nutrition int not null CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) on UPDATE CASCADE ON DELETE CASCADE,
    species_care VARCHAR(50) not null CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) on UPDATE CASCADE ON DELETE CASCADE,
);

INSERT into tbl_animalia
    (animalia_type)
    VALUES 
    ('vertebrate'),
    ('invertebrate')
;

INSERT into tbl_class 
    (class_type)
    VALUES
    ('Mammals'),
    ('bird'),
    ('lizard'),
    ('bug'),
    ('fish'),
    ('spiders'),
    ('worms'),
    ('Others')
;


INSERT into tbl_order
    (order_type)
    values 
    ('carnivore'),
    ('herbivore'),
    ('omnivore')
;

SELECT * from tbl_order;

insert into tbl_care 
    (care_id, care_type, care_specialist)
    values
    ('care_0', 'replace the straw',1),
    ('care_1', 'Repair animal toys',4),
    ('care_2', 'bottle feed vitamins',1),
    ('care_3', 'Human contact_pet subject',2),
    ('care_4', 'Clean the Animal Waste',1),
    ('care_5', 'Move subject to exercise pen',3),
    ('care_6', 'Drain and refill aquarium',1),
    ('care_7', 'extensive dental work',3)
;

SELECT * from tbl_care;

INSERT into tbl_nutrition
    (nutrition_type, nutrition_cost)
    values
    ('raw fish',1500),
    ('live rodents',600),
    ('mixture of fruit and rice',800),
    ('warm bottle of milk',600),
    ('syringe fed broth',600),
    ('lard and seed mix',300),
    ('aphids', 150),
    ('vitamins and marrow',3500)
;

SELECT * from tbl_animalia;

insert into tbl_habitat
    (habitat_type, habitat_cost)
    values 
    ('tundra',40000),
    ('grassy knoll with trees',12000),
    ('10 ft pond with rocks',50000),
    ('Ice Habitat',30000),
    ('short grass , shade, and moat', 50000),
    ('netted forest atrium',10000),
    ('jungle vines and winding branches', 15000),
    ('cliff with shaded cave ', 15000)
;

SELECT * from tbl_habitat;

insert into tbl_specialist
    (specialist_fname,specialist_lname,specialist_contact)
    values
    ('margret','nguyen','384-324-3242'),
    ('mary','fisher','653-132-6853'),
    ('arnold','holden','123-543-8573'),
    ('kem','byesan','384-123-4532'),
    ('delmonte','fyedo','768-288-3749')
;

SELECT * from tbl_specialist;

insert into tbl_species
    (species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
    values
    ('brown bear',1,100,3,5003,2200,'care_1'),
    ('jaguar',1,100,1,5003,2200,'care_4'),
    ('penguin',1,100,1,5003,2200,'care_6'),
    ('chicken',1,100,3,5001,2205,'care_2'),
    ('ghost bat',1,100,1,5006,2204,'care_0'),
    ('panda',1,100,3,5006,2202,'care_4'),
    ('bobcat',1,100,1,5001,2204,'care_5'),
    ('grey wolf',1,100,1,5000,2201,'care_4')
;



SELECT * from tbl_species;




SELECT
    a1.species_name,
    a2.animalia_type,
    a3.class_type,
    a4.order_type,
    a5.habitat_type,
    a6.nutrition_type,
    a7.care_type
    FROM tbl_species a1
    INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
    INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
    INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
    INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
    INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
    INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
    WHERE species_name = 'brown bear'
;


SELECT
    a1.species_name,
    a2.habitat_type,
    a2.habitat_cost,
    a3.nutrition_type,
    a3.nutrition_cost
FROM tbl_species a1
INNER JOIN tbl_habitat a2 ON a2.habitat_id = a1.species_habitat
INNER JOIN tbl_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
WHERE a1.species_name = 'chicken';

-- SELECT * From tbl_nutrition;
-- SELECT * From tbl_species;

-- SELECT  nutrition_type, species_name , nutrition_cost
-- From tbl_nutrition
-- INNER Join tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;



-- Slide 279 Challenges
-- 1 -- Return all Values from Habitat Table
SELECT * FROm tbl_habitat

-- 2
-- Retrieve all names from the species_name column of the tbl_species table that have a species_order value of 3

SELECT *
From tbl_species

SELECT species_name , species_order
from tbl_species
where species_order = 3

-- 3 Retrieve only the nutrition_types from tbl_nutrition that have a nutrition_cost of 600.00 or less.\

SELECT *
From tbl_nutrition

SELECT *
from tbl_nutrition
where nutrition_cost < 600



-- 4 
--Retrieve all species_names from tbl_nutrition that have a nutrition_id between 2202 and 2206. 
--(Note: You will need to INNER JOIN tbl_species and tbl_nutrition to complete the assignment.)

SELECT nutrition_id, species_name
From tbl_nutrition
Inner Join tbl_species
on tbl_species.species_nutrition = tbl_nutrition.nutrition_id



-- Compose a SELECT statement that accomplishes the following:
-- Retrieve all names from the species_name column in the tbl_species table and their corresponding nutrition_type from the tbl_nutrition table. 
--(Note: You will need to INNER JOIN tbl_species and tbl_nutrition to complete the assignment.)
-- Ensure that the data is returned using these aliases: "Species Name: " for the species_name column and "Nutrition Type: " for the nutrition_type column.

SELECT  species_name AS 'species Name:', nutrition_type as 'Nutrition Type:', nutrition_id
From tbl_nutrition
Inner Join tbl_species
on tbl_species.species_nutrition = tbl_nutrition.nutrition_id

-- From the specialist table, retrieve the first name, last name and contact number for the people that provide care to penguins

SELECT * from tbl_care
SELECT * from tbl_specialist
SELECT * from tbl_species

SELECT specialist_fname, specialist_lname, specialist_contact, care_id , species_name
from tbl_specialist
inner join tbl_care
on tbl_specialist.specialist_id = tbl_care.care_specialist
Inner join tbl_species
on tbl_species.species_care = tbl_care.care_id
WHERE care_id = 'care_6'