create schema lesson

describe lesson.teachers;

CREATE TABLE lesson.users (  
  id INTEGER,  
  name VARCHAR,  
  email VARCHAR  
);

CREATE TABLE lesson.teachers (
  id INTEGER PRIMARY KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  age INTEGER CHECK(age > 18 AND age < 70), -- check
  address VARCHAR,
  phone VARCHAR,
  email VARCHAR CHECK(CONTAINS(email, '@')) -- check
);

CREATE TABLE lesson.classes (
  id INTEGER PRIMARY KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  teacher_id INTEGER REFERENCES lesson.teachers(id) -- foreign key
);

CREATE TABLE lesson.students (
  id INTEGER PRIMARY KEY, -- primary key
  name VARCHAR NOT NULL, -- not null
  address VARCHAR,
  phone VARCHAR,
  email VARCHAR NOT NULL,
  class_id INTEGER REFERENCES lesson.classes(id) -- foreign key
);

CREATE UNIQUE INDEX teachers_name_idx ON lesson.teachers(name);
CREATE INDEX students_name_idx ON lesson.students(name);


INSERT INTO lesson.users (id, name, email)
VALUES (2, 'Jane Doe', 'jane.doe@gmail.com'),
       (3, 'John Smith', 'john.smith@gmail.com');
       
ALTER TABLE lesson.users ADD COLUMN start_date DATE;
ALTER TABLE lesson.users RENAME id TO uid;

SELECT * FROM lesson.students;
CREATE VIEW lesson.students_view AS
SELECT id, name, email
FROM lesson.students;

select * from lesson.students_view;

copy lesson.students to "student_view.json";