import express from "express";
import knex from "knex";

const app = express();
const port = 3000;

// This connects to the database stored in the file mentioned below
const knexInstance = knex({
  client: "sqlite3",
  connection: {
    filename: "./database.sqlite3",
  },
  useNullAsDefault: true, // Omit warning in console
});

app.get("/", (req, res) => {
  res.send("Hello from exercise 2!");
});

// Here is an example of the first route, /all-users, which returns all users sorted by their ID
app.get("/all-users", async (req, res) => {
  const rows = await knexInstance.raw("SELECT * FROM users ORDER BY id ASC;");
  res.json(rows);
});

app.get("/unconfirmed-users", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users where confirmed_at isnull ;",
  );
  res.json(rows);
});

app.get("/gmail-users", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users where email like '%gmail.com';",
  );
  res.json(rows);
});

app.get("/2022-users", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users where created_at like '2022%';",
  );
  res.json(rows);
});

app.get("/user-count", async (req, res) => {
  const rows = await knexInstance.raw("SELECT count(*) FROM users ;");
  res.json(rows);
});

app.get("/last-name-count", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT count(*) FROM users where last_name NOTNULL order by last_name asc;",
  );
  res.json(rows);
});

// app.get("/first-user", async (req, res) => {
//   const rows = await knexInstance.raw(
//     "SELECT * FROM users where created_at like '2022%';",
//   );
//   res.json(rows);
// });

// TODO implement more routes here

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
