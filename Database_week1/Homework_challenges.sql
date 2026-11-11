
-- Count the tasks
—--Return the total number of rows in task as a single value.
Select count(*) from task;

-- Count tasks without valid due dates
—--Return the number of tasks with no valid due date, including NULL or unparseable dates, as a single value.
Select count(*) from task where due_date ISNULL;

-- Done tasks
—--Return all columns of tasks marked Done.
select t.*
from task t 
join status s
on t.status_id = s.id
where s.name = 'Done';


-- Tasks not done
—--Return all columns of tasks not marked Done.
select t.*
from task t 
join status s
on t.status_id = s.id
where s.name != 'Done';

-- Tasks by creation date
—--Return all columns of every task, ordered by creation date with the most recent first.
SELECT * FROM task
order by created DESC ;


—-- Most recently created task
—--Return all columns of the single most recently created task.
SELECT * FROM task
order by created DESC LIMIT 1 ;

—-- Tasks mentioning database
—--Return the title and due date of tasks whose title or description contains 'database', ignoring case. Column order: title, due_date.
SELECT title, due_date FROM task
where title like '%database%'
OR description like '%database%'
ORDER BY title, due_date;

—-- Task titles and IDs
SELECT id, title FROM task
ORDER BY id ASC;

—-- Tasks in progress—
—-- Return the id and title of tasks with status_id 2. Column order: id, title. Order by id ascending.
SELECT id, title FROM task
WHERE status_id=2
ORDER BY id ASC;

-- Tasks without due dates
—--Return the id and title of tasks whose due_date is NULL. Column order: id, title. Order by id ascending.

SELECT id, title FROM task
WHERE due_date ISNULL
ORDER BY id ASC;

-- Tasks alphabetically
--Return each task's id and title, ordered by title alphabetically (A to Z). Column order: id, title.
SELECT id, title FROM task
ORDER BY title ASC;

--Five highest task IDs
--Return the id and title of the five tasks with the highest IDs, highest ID first. Column order: id, title.
SELECT id, title FROM task
ORDER BY id DESC LIMIT 5;


--Unassigned tasks
--Return the id and title of tasks with no assigned user (user_id is NULL). Column order: id, title. Order by id ascending.
SELECT id, title FROM task
WHERE user_id ISNULL
ORDER BY id ASC;

--Rename a task
--Change the title of task id 1 to 'Wash the laundry'. Update only that task and no other columns.
UPDATE task
SET title='Wash the laundry'
WHERE id=1;


--Mark a task done
--Set status_id to 3 for task id 22 only. Leave every other task unchanged.
UPDATE task
SET status_id=3
WHERE id=22;

--Assign an unassigned task
--Assign task id 23 to user id 11 by setting user_id to 11. Change no other rows or columns.
UPDATE task
SET user_id=11
WHERE id=23;

--Set unassigned task status
--Set status_id to 1 for tasks whose user_id is NULL. These are task ids 23 and 35; change no other rows or columns.
UPDATE task
SET status_id=1
WHERE user_id ISNULL;

-- Delete one task
—--Delete task id 35 only. Do not delete or change any other rows.
delete from task where id=35;



--Remove one task tag
--Remove the Personal tag association (tag_id 2) from task id 1 only. Do not delete the task or any other tag association.
select * from task_tag;
DELETE from task_tag WHERE task_id=1 and tag_id=2;
select * from task_tag;

-- Create task notes table
—--Create a table named task_note with columns in this order: id INTEGER PRIMARY KEY, task_id INTEGER NOT NULL, note TEXT NOT NULL. Add a foreign key from task_id to task(id).
CREATE TABLE task_note
(id INTEGER PRIMARY KEY, 
task_id INTEGER NOT NULL, 
note TEXT NOT NULL,
FOREIGN KEY (task_id) REFERENCES task(id));

SELECT * FROM task_note;
