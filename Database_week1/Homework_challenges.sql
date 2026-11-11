{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red224\green232\blue240;\red18\green21\blue26;}
{\*\expandedcolortbl;;\cssrgb\c90196\c92941\c95294;\cssrgb\c8627\c10588\c13333;}
\paperw11900\paperh16840\margl1440\margr1440\vieww28600\viewh17440\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf0 \
-- Count the tasks\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return the total number of rows in task as a single value.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
Select count(*) from task;\
\
-- Count tasks without valid due dates\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return the number of tasks with no valid due date, including NULL or unparseable dates, as a single value.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
Select count(*) from task where due_date ISNULL;\
\
-- Done tasks\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return all columns of tasks marked Done.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
select t.*\
from task t \
join status s\
on t.status_id = s.id\
where s.name = 'Done';\
\
\
-- Tasks not done\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return all columns of tasks not marked Done.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
select t.*\
from task t \
join status s\
on t.status_id = s.id\
where s.name != 'Done';\
\
-- Tasks by creation date\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return all columns of every task, ordered by creation date with the most recent first.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT * FROM task\
order by created DESC ;\
\
\
\'97-- Most recently created task\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return all columns of the single most recently created task.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT * FROM task\
order by created DESC LIMIT 1 ;\
\pard\pardeftab720\sa160\partightenfactor0
\cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 \
\pard\pardeftab720\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \'97-- Tasks mentioning database\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return the title and due date of tasks whose title or description contains 'database', ignoring case. Column order: title, due_date.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT title, due_date FROM task\
where title like '%database%'\
OR description like '%database%'\
ORDER BY title, due_date;\
\
\'97-- Task titles and IDs\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return every task's id and title. Column order: id, title. Order by id ascending.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT id, title FROM task\
ORDER BY id ASC;\
\
\'97-- Tasks in progress\'97\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return the id and title of tasks with status_id 2. Column order: id, title. Order by id ascending.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT id, title FROM task\
WHERE status_id=2\
ORDER BY id ASC;\
\
-- Tasks without due dates\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Return the id and title of tasks whose due_date is NULL. Column order: id, title. Order by id ascending.\
\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
SELECT id, title FROM task\
WHERE due_date ISNULL\
ORDER BY id ASC;\
\
-- Tasks alphabetically\
--Return each task's id and title, ordered by title alphabetically (A to Z). Column order: id, title.\
SELECT id, title FROM task\
ORDER BY title ASC;\
\
--Five highest task IDs\
--Return the id and title of the five tasks with the highest IDs, highest ID first. Column order: id, title.\
SELECT id, title FROM task\
ORDER BY id DESC LIMIT 5;\
\
\
--Unassigned tasks\
--Return the id and title of tasks with no assigned user (user_id is NULL). Column order: id, title. Order by id ascending.\
SELECT id, title FROM task\
WHERE user_id ISNULL\
ORDER BY id ASC;\
\
--Rename a task\
--Change the title of task id 1 to 'Wash the laundry'. Update only that task and no other columns.\
UPDATE task\
SET title='Wash the laundry'\
WHERE id=1;\
\
\
--Mark a task done\
--Set status_id to 3 for task id 22 only. Leave every other task unchanged.\
UPDATE task\
SET status_id=3\
WHERE id=22;\
\
--Assign an unassigned task\
--Assign task id 23 to user id 11 by setting user_id to 11. Change no other rows or columns.\
UPDATE task\
SET user_id=11\
WHERE id=23;\
\
--Set unassigned task status\
--Set status_id to 1 for tasks whose user_id is NULL. These are task ids 23 and 35; change no other rows or columns.\
UPDATE task\
SET status_id=1\
WHERE user_id ISNULL;\
\
-- Delete one task\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Delete task id 35 only. Do not delete or change any other rows.\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
delete from task where id=35;\
\
\
\
--Remove one task tag\
--Remove the Personal tag association (tag_id 2) from task id 1 only. Do not delete the task or any other tag association.\
select * from task_tag;\
DELETE from task_tag WHERE task_id=1 and tag_id=2;\
select * from task_tag;\
\
-- Create task notes table\
\'97\cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Create a table named task_note with columns in this order: id INTEGER PRIMARY KEY, task_id INTEGER NOT NULL, note TEXT NOT NULL. Add a foreign key from task_id to task(id).\cf0 \cb1 \kerning1\expnd0\expndtw0 \outl0\strokewidth0 \
CREATE TABLE task_note\
(id INTEGER PRIMARY KEY, \
task_id INTEGER NOT NULL, \
note TEXT NOT NULL,\
FOREIGN KEY (task_id) REFERENCES task(id));\
\
SELECT * FROM task_note;\
\
}