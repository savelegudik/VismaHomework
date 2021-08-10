-- # 1. Create a table with the name ‘onlineshop’ with these fields.
CREATE TABLE onlineshop
(
    stock   INT UNSIGNED   DEFAULT '0000' NOT NULL,
    product CHAR(20)       DEFAULT ''     NOT NULL PRIMARY KEY,
    dealer  CHAR(20)       DEFAULT ''     NOT NULL PRIMARY KEY,
    price   DECIMAL(16, 2) DEFAULT '0.00' NOT NULL
);
-- In the assignment, you asked to use two primary keys for this table,
-- but there can be only one in total, as far as I know.
-- Primary key we use for ID usually. And it is Auto increment.


-- # 2. Insert data in the table.
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (1, 'Fortnite', 'AAA', 23.45);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (2, 'Minecraft', 'AAA', 23.99);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (3, 'FIFA 22', 'AAA', 10.99);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (4, 'Fortnite', 'BBB', 21.45);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (5, 'Minecraft', 'BBB', 23.69);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (6, 'Space Invaders', 'CCC', 12.25);
INSERT INTO onlineshop (stock, product, dealer, price)
VALUES (7, 'Minecraft', 'DDD', 23.95);


-- # 3. Write the query to retrieve the highest stock product.
SELECT MAX(stock), product
FROM onlineshop;


-- # 4. Write a query to find the stock number, product, dealer and price of the most expensive article.
SELECT stock, product, dealer, MAX(price)
FROM onlineshop;


-- # 5. Write a query to find the highest price per product.
-- What is the difference between the previous question?
-- I suppose it could be the same query.

-- # 6. Create the following tables.
CREATE TABLE student
(
    id         INT UNSIGNED DEFAULT '0000' NOT NULL PRIMARY KEY,
    first_name CHAR(20)     DEFAULT ''     NOT NULL,
    last_name  CHAR(20)     DEFAULT ''     NOT NULL
);

CREATE TABLE student_course
(
    student_id INT UNSIGNED DEFAULT '0000' NOT NULL,
    course_id  CHAR(20)     DEFAULT '0000' NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (course_id) REFERENCES course (id)
);
-- In the task was written two Primary keys, I suppose it is Foreign keys.
-- Because we usually use only one in total.


CREATE TABLE course
(
    id         INT UNSIGNED DEFAULT '0000' NOT NULL PRIMARY KEY,
    name       CHAR(20)     DEFAULT ''     NOT NULL,
    teacher_id INT UNSIGNED DEFAULT '0000' NOT NULL
);


-- # 7. Add the following data.
INSERT INTO student (id, first_name, last_name)
VALUES (1, 'Noah', 'Jones');
INSERT INTO student (id, first_name, last_name)
VALUES (2, 'Elijah', 'Foster');
INSERT INTO student (id, first_name, last_name)
VALUES (3, 'Charlotte', 'Davis');

INSERT INTO student_course (student_id, course_id)
VALUES (1, 2);
INSERT INTO student_course (student_id, course_id)
VALUES (1, 3);
INSERT INTO student_course (student_id, course_id)
VALUES (2, 1);
INSERT INTO student_course (student_id, course_id)
VALUES (2, 2);
INSERT INTO student_course (student_id, course_id)
VALUES (2, 3);
INSERT INTO student_course (student_id, course_id)
VALUES (3, 1);

INSERT INTO course (id, name, teacher_id)
VALUES (1, 'Database design', 1);
INSERT INTO course (id, name, teacher_id)
VALUES (2, 'Java', 2);
INSERT INTO course (id, name, teacher_id)
VALUES (3, 'Python', 3);


-- # 8. Write a query to obtain all students first names, last names and course name.
SELECT student.first_name, student.last_name, course.name
FROM student
INNER JOIN course ON student.id=student_course.student_id;

-- It's difficult to complete this task. I now when we use two tables.
-- For instance, table `student` and `course`. `student` table has the same columns,
-- but course - id, name, teacher_id and student_id.

SELECT student.first_name, student.last_name, course.name
FROM student
INNER JOIN course ON student.id=course.student_id;


-- # 9. Write a query to return the first name, last name and total number of courses of each student.
SELECT first_name, last_name, COUNT(*)
FROM student_course;
-- I also have problem with table `student_course`, because I never used this kind of relatives.


-- # 10. Delete the course with id 2. How does this affect the other tables?
DELETE FROM course WHERE id=2;
-- In table `student_course` still be values with course id=2