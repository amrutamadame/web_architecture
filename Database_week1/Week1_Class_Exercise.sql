{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red224\green232\blue240;\red18\green21\blue26;}
{\*\expandedcolortbl;;\cssrgb\c90196\c92941\c95294;\cssrgb\c8627\c10588\c13333;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh17440\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs28 \cf0 \
-- Names and phones\
SELECT name, phone FROM user;\
\
\'97-- Users by name\
SELECT * from user ORDER BY name ASC;\
\
-- Name of user 10\
SELECT name from user where id=10;\
\
-- Three oldest tasks\
select * from task order by created asc limit 3;\
\
-- Bonus: Tasks without descriptions\
select * from task where description ISNULL;\
\
-- Bonus: Users with .com email\
select * from user where email like '%.com';\
\
-- Not started task titles\
select title from task where status_id=1;\
\
-- User 1's in-progress tasks\
select * from task where user_id=1 and status_id=2;\
\
-- Task titles containing database\
select * from task where title like '%database%';\
\
-- Users without phone numbers\
select name from user where phone ISNULL;\
\
-- Five newest tasks\
select title, created from task order by created desc limit 5;\
\
-- Open tasks by title\
select * from task where status_id IN (1,2) order by title;\
\
-- Mark task 1 done\
update task SET status_id=3 where id=1;\
\
-- Change task 2 description\
update task set description='Write and test SELECT queries' where id=2;\
\
-- Change task 3 title\
update task set title='Practice: Review query results' where id=3;\
\
\'97-- Change task 4 due date\
update task set due_date='2031-01-15' where id=4;\
\
-- Change user 1 phone\
update user set phone='12345678' where id=1;\
\
-- Change tag 1 name\
update tag set name='Practice' where id=1;\
\
-- Insert a task for user 1\
INSERT into task (id, title, created, updated, status_id, user_id) values (100,'Practice 1: Read SQL','2030-01-01','2030-01-01',1,1);\
\
-- Insert a task with description\
INSERT into task (id, title, description, created, updated, status_id) values (100,'Practice 2: Write queries','Practice SQL','2030-01-01','2030-01-01',1);\
\
-- Insert an in-progress task\
INSERT into task (id, title, created, updated, status_id, user_id)  values (100,'Practice 3: Review results','2030-01-01','2030-01-01',2,1);\
\
-- Insert a task with due date\
INSERT into task (id, title, created, updated, due_date, status_id)  values (100,'Practice 4: Plan a project','2030-01-01','2030-01-01','2030-12-31',1);\
\
-- Insert a user\
INSERT INTO user (id, name, email) values (100, 'Practice User', 'practice@example.com');\
\
-- Insert a tag\
\pard\pardeftab720\partightenfactor0

\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 \'97Insert tag 100 named 'Practice'.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 INSERT INTO tag (id, name) VALUES (100, 'Practice');\
\
-- Delete a task\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Delete task 23. Work on the fresh practice database; leave all other data unchanged.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
delete from task where id=23;\
\
-- Delete a user\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Delete user 11. Work on the fresh practice database; leave all other data unchanged.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
delete from user where id=11;\
\
-- Delete a tag\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Delete tag 5 from the fresh practice database. Its task associations will also be deleted. Leave all other data unchanged.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
delete from tag where id=5;\
\
-- Create a practice note table\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Create practice_note with id INTEGER PRIMARY KEY, title TEXT NOT NULL, and optional details TEXT. Insert a note with id 1, title 'First note' and details 'Practising CREATE TABLE'.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
create table practice_note (\
  id INTEGER PRIMARY KEY, \
  title TEXT NOT NULL, \
  details TEXT\
);\
INSERT INTO practice_note (id, title, details) VALUES (1, 'First note', 'Practising CREATE TABLE');\
select * from practice_note;\
\
-- Interactive CRUD practice\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Insert task 100 titled 'Prepare presentation', created and updated '2030-01-01', status Not started and user 1; then change its status to In progress. Leave other optional fields NULL.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
INSERT INTO task (id, title, created, updated, status_id, user_id) VALUES (100,'Prepare presentation','2030-01-01','2030-01-01',1,1);\
select * from task where id=100;\
update task set status_id=2 where id=100;\
select * from task where id=100;\
\
\
-- Reference solution for: Combine users and tasks\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Insert user 100 named 'Practice User' with email 'practice@example.com' and no phone. Insert two tasks for that user: task 100 titled 'Read SQL' with status In progress, and task 101 titled 'Write SQL' with status Not \'97\'97started. Set both tasks' created and updated to '2030-01-01'; leave other optional fields NULL.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
INSERT INTO user (id, name, email) VALUES (100, 'Practice User', 'practice@example.com'); \
INSERT INTO task (id, title, created, updated, status_id, user_id) VALUES (100, 'Read SQL', '2030-01-01', '2030-01-01', 2, 100), \
  (101, 'Write SQL', '2030-01-01', '2030-01-01', 1, 100);\
\
\
-- Create a practice book table\
\'97
\f1 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Create practice_book with id INTEGER PRIMARY KEY, required title TEXT, and optional author TEXT. Insert a book with id 1, title 'SQL Practice' and author 'Practice User'.
\f0 \cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
create table practice_book (\
  id INTEGER PRIMARY KEY, \
  title TEXT NOT NULL,\
  author TEXT NULL\
);\
insert into practice_book (id, title, author) values (1,'SQL Practice','Practice User');\
select * from practice_book;\
}