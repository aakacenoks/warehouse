const mysql = require('mysql');
const express = require('express');
var app = express();
const bodyparser = require('body-parser');
var port = 3001;

app.use(bodyparser.json());
app.use(bodyparser.urlencoded({
  extended: true
}));

app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});

var mysqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'Builds',
    multipleStatements: true,
    insecureAuth : true
});

mysqlConnection.connect((err) => {
    if (!err) {
        console.log('DB connection succeded.');
    } else {
        console.log('DB connection failed \n Error : ' + JSON.stringify(err, undefined, 2));
    }
});

app.listen(port, '192.168.1.65', () => console.log('Express server is runnig at port no: ' + port));

app.get('/', (req, res) => {
    res.send('Ja teikšu, ka šeit nekā nav, vai Tu ticēsi?')
})

app.get('/api/ios', (request, res) => {
    mysqlConnection.query('SELECT * FROM iOS ORDER BY version DESC LIMIT 1000', (err, rows, fields) => {
        if (!err) {
            console.log("Sent info for iOS. Number of rows: " + rows.length)
            res.send(rows)
        } else {
            console.log(err);
        }
    })
});

app.get('/api/android', (request, res) => {
    mysqlConnection.query('SELECT * FROM Android ORDER BY version DESC LIMIT 1000', (err, rows, fields) => {
        if (!err) {
            console.log("Sent info for Android. Number of rows: " + rows.length)
            res.send(rows);
        } else {
            console.log(err);
        }
    })
});

app.post('/api/upload', (req, res) => {
    let platform = req.body.platform;
    let version = req.body.version;
    let env = req.body.env;
    let url = req.body.url;
    let name = req.body.name;
    console.log(req.body);
    var query = "INSERT INTO " + platform + " (version, environment, url, name)" +
                "VALUES ('"+version+"', '"+env+"', '"+url+"', '"+name+"')"
    mysqlConnection.query(query, (err, rows, fields) => {
        if (!err) {
            res.send('Success');
        } else {
            console.log(err);
        }
    })
});