/**
 * Authentication route for the server.
 */
const router = require("express").Router();

//Empty router for registration.
router.post("/register", (req, res) => {
    res.send("Register");
});

router.post('/login', (req, res) => {
    res.send('Login');
});

module.exports = router;