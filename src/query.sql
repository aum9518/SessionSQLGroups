create table groups(
                       id serial primary key ,
                       group_name varchar
);

insert into groups(group_name)
values ('Java-9'),
       ('JS-6'),
       ('English'),
       ('Python-1'),
       ('PM-1');

insert into groups(group_name)
values ('PHP'),
       ('TS');


create table courses(
                        id serial primary key ,
                        course_name varchar,
                        date_of_start date,
                        group_id int references groups(id)
);

insert into courses(course_name, date_of_start, group_id)
values ('Java', '2023-1-3', 1),
       ('Js', '2022-4-3', 2),
       ('Python', '2023-4-12', 4),
       ('JS kids', '2022-1-1', 2),
       ('Scratch', '2022-1-1', 1),
       ('Python kids', '2021-3-1', 4),
       ('Technical English', '2020-1-1', 3);

insert into courses (course_name, date_of_start, group_id)
values ('SoftSkills', '2020-12-12', null);


create table mentors(
                        id serial primary key ,
                        first_name varchar,
                        last_name varchar,
                        gender varchar, -- add check
                        email varchar, -- add unique
                        specialization varchar,
                        experience int,
                        course_id int references courses(id)
);

insert into mentors(first_name, last_name, gender, email, specialization, experience, course_id)
values ('Aijamal', 'Asangazieva', 'Female', 'aijamal@gmail.com', 'Java and Python instructor', 2, 1),
       ('Datka', 'Mamatzhanova', 'Female', 'datka@gmail.com', 'Java mentor', 1, 1),
       ('Aijamal', 'Asangazieva', 'Female', 'aijamal@gmail.com', 'Java and Python instructor', 2, 3),
       ('Ainazik', 'Toktomamatova', 'Female', 'ainazik@gmail.com', 'English teacher', 5, 4),
       ('Ulan', 'Kybanychbekov', 'Male', 'ulan@gmail.com', 'JS mentor', 3, 2),
       ('Aizhan', 'Nurmatova', 'Female', 'aizhan@gmail.com', 'PM', 1, null),
       ('Nurisa', 'Mamiraimova', 'Female', 'nurisa@gmail.com', 'Java mentor', 1, null);


create table students(
                         id serial primary key ,
                         first_name varchar,
                         last_name varchar,
                         date_of_birth date,
                         gender varchar, -- add check
                         email varchar, -- add unique
                         group_id int references groups(id)
);

insert into students(first_name, last_name, date_of_birth, gender, email, group_id)
values ('Aizat', 'Duisheeva', '2003-3-13', 'Female', 'aizat@gmail.com', 1),
       ('Ainazik', 'Amangeldieva', '2002-2-2', 'Female', 'ainazik12@gmail.com', 1),
       ('Elizar', 'Aitbekov', '2001-9-9', 'Male', 'elizar@gmail.com', 2),
       ('Bektur', 'Kanybekov', '2000-1-9', 'Male', 'bektur@gmail.com', 2),
       ('Daniel', 'Kamilzhanov', '2004-9-23', 'Male', 'daniel@gmail.com', 2),
       ('Torogeldi', 'Niyazbekov', '2007-3-9', 'Male', 'torogeldi@gmail.com', 1),
       ('Sanzhar', 'Abdymomunov', '1999-9-9', 'Male', 'sanzhar@gmail.com', 1),
       ('Bermet', 'Aitbekova', '1996-6-9', 'Female', 'bermet@gmail.com', 2),
       ('Aziza', 'Arzykulova', '1991-1-31', 'Female', 'aziza@gmail.com', 3),
       ('Kamcybek', 'Kuzobaev', '1994-6-22', 'Male', 'kamchybek@gmail.com', null),
       ('Den', 'Garden', '1970-6-24', 'Male', 'den@gmail.com', 4),
       ('Jay', 'Bird', '1980-6-9', 'Male', 'jay@gmail.com', 4),
       ('RM', 'Kim', '1994-9-12', 'Male', 'rm@gmail.com', 4),
       ('J-Hope', 'Jung', '1994-2-18', 'Male', 'jhope@gmail.com', 4),
       ('Daniella', 'Park', '2005-2-14', 'Female', 'daniella@gmail.com', 4),
       ('Jennie', 'Kim', '1996-1-9', 'Female', 'jennie@gmail.com', null),
       ('Lisa', 'Monoban', '1996-3-27', 'Female', 'lalisa@gmail.com', 4),
       ('Adinai', 'Sharshekeeva', '1992-7-12', 'Female', 'adinai@gmail.com', 3),
       ('Rose', 'Park', '2006-7-12', 'Female', 'rose@gmail.com', 5),
       ('Aikezhan', 'Akhamatova', '1992-1-12', 'Female', 'aikezhan@gmail.com', 5),
       ('Mirbek', 'Nazhmidinov', '2007-12-31', 'Male', 'mirbek@gmail.com', 5),
       ('Aikeldi', 'LastName', '1998-7-12', 'Female', 'aikeldi@gmail.com', 5);


create table lessons(
                        id serial primary key ,
                        lesson_name varchar,
                        course_id int references courses(id)
);

insert into lessons(lesson_name, course_id)
values ('SQL', 1),
       ('Git', 1),
       ('ArrayList', 1),
       ('LinkedList', 1),
       ('Stream', 1),
       ('HTML', 2),
       ('CSS', 2),
       ('UI-UX', null),
       ('Teg', 2),
       ('Verbs', 4),
       ('Noun', 4),
       ('Adjective', 4),
       ('Adverb', 4),
       ('sout', 3);

select * from groups;
select groups, count(groups) from groups group by groups ;
select * from groups join courses c on groups.id = c.id;
select * from groups join courses c on groups.id = c.id where date_of_start between '2020-1-1'and '2023-3-3';
select first_name,date_of_birth, course_name from students   join groups g on students.id=g.id join  courses c on g.id=c.id where date_of_birth between '1980-1-1' and '2004-12-12' ;
alter table students  add column age int;
update students set age=date_part('year', age(current_date,date_of_birth));
select sum(age) from students join courses c on students.id = c.id where course_name = 'Python';
select concat(first_name, ' ', last_name) ,age,email , course_name from students join courses c on students.id= c.id join groups g on students.id = g.id where g.id =3;
select * from courses join groups g on courses.id = g.id where group_name in ('Java-9');
select count(*), g.group_name from students join groups g on students.id= g.id group by g.group_name;
select g.group_name ,count(*) from students join groups g on g.id = students.group_id group by g.group_name;
select g.group_name, count (*)from students join groups g on g.id = students.group_id group by g.group_name having count(*)>4;
select students.id ,first_name,gender , group_name from students join groups g on g.id = students.group_id where group_id = 4 order by first_name desc ;
select * from lessons;
select count (*) from students join   courses c on c.group_id=students.group_id  join groups g on students.group_id = g.id where c.id=4 group by c.id;
select first_name ,email, specialization,course_name from mentors join courses c on mentors.id = c.id where c.id=2;
select c.course_name, count(*) from mentors join courses c on mentors.course_id = c.id  group by c.course_name;
select c.course_name, count(*)from mentors join courses c on mentors.course_id = c.id group by c.course_name having count(*)>1 ;
select course_name ,date_of_start, m.first_name from courses join mentors m on courses.id = m.id where date_of_start between '2020-1-1' and '2023-3-3';
select first_name , age, email from students join courses c on students.group_id = c.group_id where course_name = 'Java';
select * from courses left join mentors m on courses.id = m.course_id  where m.course_id is null;
select * from courses left join lessons l on courses.id = l.course_id where l.course_id is null;
select * from courses  join groups g on courses.group_id = g.id left join lessons l on courses.id = l.course_id where l.course_id is null;
--students query
select count(*) from students;
select count (*) from students where extract(year from age(current_date, date_of_birth))>18;
select first_name, email, gender from students where id = 2;
select sum(extract(year from age(current_date,date_of_birth))) from students where extract(year from age (current_date,date_of_birth))<20;
select * from students join groups g on students.group_id  = g.id where g.id= 4;
select gender , count (gender)from students group by gender ;
update students set first_name = 'Manas',  last_name = 'Abdugani uulu', date_of_birth='8-26-1995',gender = 'Male',email = 'manas@gmail.com',group_id = 6 where id = 8;
select * from students join groups g on students.group_id = g.id join courses c on g.id = c.group_id where c.id = 5 order by age desc limit 1;
alter table students add constraint  varchar unique (email);
alter table mentors add constraint int check (gender ='Male' or gender = 'Female');
alter table mentors rename to instructors;
--mentors
select first_name, email, specialization from instructors join courses c on instructors.course_id =c.id join  groups g on c.group_id = g.id where g.group_name = 'Java-9';
select * from instructors where experience >1;
select * from instructors where course_id is null;
select *,i.id,i.first_name from students   join instructors i on students.id = i.course_id;
select concat(i.first_name ,' ',i.last_name)as full_name, count(*) from students join groups g on students.group_id = students.group_id join courses c on g.id=c.group_id join instructors i on c.id = i.course_id  group by full_name ;
select * from instructors left join courses c on instructors.course_id = c.id left join groups g on c.group_id = g.id left  join students s on g.id = s.group_id where c.group_id is null;
select * from instructors join courses c on instructors.course_id = c.id where instructors.id = 5;
select * from lessons join instructors i on lessons.course_id=i.course_id where i.id=5;
--lessons
select * from lessons ;
select * from lessons join students s on lessons.course_id=s.group_id where s.id = 2;
select g.group_name, count (*) from lessons join groups g on lessons.course_id = g.id group by g.group_name having count(*)>2;
select * from lessons join students s on lessons.course_id = s.group_id where s.id = 7 order by lesson_name;
select * from lessons join courses c on lessons.course_id = c.id where c.course_name ='Java';
select * from lessons join instructors i on lessons.course_id = i.course_id where i.id = 5;



