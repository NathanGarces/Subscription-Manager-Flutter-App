const express = require("express");
const app = express();

//Import Routes
const authRoute = require("./routes/auth");

//Route Middlewares
app.use('/api/user', authRoute); //Pathway to register is api/user/register

app.listen(3000, () => console.log("Server is up and running!"));