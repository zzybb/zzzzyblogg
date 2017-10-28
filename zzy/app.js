let express = require('express');
let bodyParser = require('body-parser');
let router = require('./routes/router');
let session = require('express-session');
let SessionStore = require('express-mysql-session');
let cookieParser = require('cookie-parser');
let app = express();

var options = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'vueadmin'
}  


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(session({
    secret: 'zzy',
    name: 'cooikeId',
    cookie: { maxAge: 1000 * 60 * 8 },
    resave: false,
    saveUninitialized: true,
    store: new SessionStore(options) 
}))

app.use(router);
app.listen(9999, () => {
    console.log("ok");
}
    );