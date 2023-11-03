
-- -- INSERT into tbl_animalia
-- --     (animalia_type)
-- --     VALUES 
-- --     ('vertebrate'),
-- --     ('invertebrate')
-- -- ;


SELECT * FROM tbl_animalia;

-- CREATE TABLE tbl_class (
--     class_id INT PRIMARY KEY not NULL IDENTITY (100,1),
--     class_type VARCHAR(50) NOT NULL
-- );

-- INSERT into tbl_class 
--     (class_type)
--     VALUES
--     ('bird'),
--     ('lizard'),
--     ('bug'),
--     ('fish'),
--     ('spiders')
-- ;

-- UPDATE tbl_class SET class_type = 'bird' where class_type = 'bird' 

-- SELECT * FROM tbl_class;



-- SELECT COUNT(class_type)
-- from tbl_class WHERE class_type = 'birds';

-- CREATE TABLE tbl_persons (
--     person_id INT PRIMARY KEY not NULL IDENTITY (1,1),
--     person_Fname VARCHAR(50) NOT NULL,
--     person_Lname VARCHAR(50) NOT NULL,
--     person_contact VARCHAR(50) NOT NULL
-- );


-- INSERT into tbl_persons
--     (person_Fname,person_Lname,person_contact)
--     VALUES
--     ('bird' , 'smith' , '32901123'),
--     ('James', 'phil', '21341243'),
--     ('abby','anderson','13131312')
-- ;

-- SELECT person_Fname, person_Lname , person_contact , person_id FROM tbl_persons WHERE person_id BETWEEN 2 And 3;


-- SELECT person_Fname, person_Lname , person_contact , person_id FROM tbl_persons WHERE person_Lname LIKE 's%'


-- -- SELECT * from tbl_persons;

-- -- DELETE from tbl_persons;

-- -- SELECT * from tbl_persons;

-- UPDATE tbl_persons set person_Fname = 'mars' where person_Fname = 'bird';

-- SELECT * from tbl_persons;

-- INSERT into tbl_persons
--     (person_Fname,person_Lname,person_contact)
--     VALUES
--     ('mary' , 'jane' , '3142890')
-- ;

-- SELECT person_Fname as FirstName, person_Lname as LastName , person_contact as Phone from tbl_persons 
--WHERE person_Fname like 'm%' ORDER by person_Lname

-- DELETE from tbl_persons where person_Lname = 'smith'

-- -- drop table tbl_persons

-- SELECT * from tbl_persons;

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

SELECT * from tbl_nutrition;

insert into tbl_habitat
    (habitat_type, habitat_cost)
    values 
    ('tundra',40000),
    ('grassy knoll with trees',12000),
    ('10 ft pond with rocks',50000),
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

SELECT * from tbl_species;


insert into tbl_species
    (species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
    values
    ('brown bear',1,102,3,5003,2200,'care_1'),
    ('jaguar',1,102,1,5003,2200,'care_4'),
    ('penguin',1,100,1,5003,2200,'care_6'),
    ('ghost bat',1,102,1,5006,2204,'care_0'),
    ('panda',1,102,3,5006,2202,'care_4'),
    ('bobcat',1,102,1,5001,2204,'care_5'),
    ('grey wolf',1,102,1,5000,2201,'care_4')
;



SELECT * from tbl_species;

insert into tbl_species
    (species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
    values
    ('Chicken',1,100,3,5001,2205,'care_0')
;

insert into tbl_habitat
    (habitat_type, habitat_cost)
    values 
    ('Ice Room With Waterfall', 15000)
;


SELECT * from tbl_species where species_name = 'chicken';

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
WHERE a1.species_name = 'ghost bat';

SELECT * From tbl_nutrition;
SELECT * From tbl_species;

SELECT  nutrition_type, species_name , nutrition_cost
From tbl_nutrition
INNER Join tbl_species ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id;


-- drop Table tbl_species, tbl_animalia, tbl_care, tbl_class, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;

-- if exists (SELECT 1 from INFORMATION_SCHEMA.TABLES tbl_species)
--     drop Table tbl_species, tbl_animalia, tbl_care, tbl_class, tbl_habitat, tbl_nutrition, tbl_order, tbl_specialist;

