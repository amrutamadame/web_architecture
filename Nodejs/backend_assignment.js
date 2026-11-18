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

// 5. Updated Home Route returning a styled HTML dashboard fetching /user-count
app.get("/", async (req, res) => {
  try {
    const result = await knexInstance.raw(
      "SELECT COUNT(*) as count FROM users;",
    );
    const userCount = result[0].count;

    const htmlResponse = `
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>User Database Dashboard</title>
       <style>
          body {
            background-color: #fff5f5;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
          }

          h1 {
            color: #c8102e;
          }

          #userCount {
            color: #c8102e;
            font-size: 28px;
            font-weight: bold;
          }
        </style>
    </head>
    <body>
        <h1>User Dashboard</h1>
        <p>Total number of registered users in the database:</p>
        <p id="userCount">${userCount}</p>
    </body>
    </html>
`;
    res.send(htmlResponse);
  } catch (err) {
    res.status(500).send("Error while fetching data");
  }
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
  const result = await knexInstance.raw("SELECT COUNT(*) AS count FROM users;");
  res.json(result[0]);
});

app.get("/last-name-count", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT count(*) FROM users where last_name NOTNULL order by last_name asc;",
  );
  res.json(rows);
});

// --- 2. THREE NEW USEFUL ROUTES ---

// 1. Returns users who have confirmed their account (confirmed_at is not null)
app.get("/verified-users", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users WHERE confirmed_at IS NOT NULL;",
  );
  res.json(rows);
});

// 2. Returns the most recently created user
app.get("/latest-user", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users ORDER BY created_at DESC LIMIT 1;",
  );
  res.json(rows);
});

// 3. Returns users with Yahoo email addresses
app.get("/yahoo-users", async (req, res) => {
  const rows = await knexInstance.raw(
    "SELECT * FROM users WHERE email LIKE '%yahoo.com';",
  );
  res.json(rows);
});

app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});
