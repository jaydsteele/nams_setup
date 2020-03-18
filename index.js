var mysql = require('mysql')
var express = require('express')
let mustacheExpress = require('mustache-express');
let bodyParser = require('body-parser');

if (!process.env.NAMS_MYSQL_USER || !process.env.NAMS_MYSQL_PASSWORD) {
  console.error('You must set NAMS_MYSQL_USER and NAMS_MYSQL_PASSWORD environment variables')
  process.exit(1)
}

var connection = mysql.createConnection({
  host: 'localhost',
  user: process.env.NAMS_MYSQL_USER,
  password: process.env.NAMS_MYSQL_PASSWORD,
  database: 'hockey'
})

connection.connect(function(err) {
  if (!err) {
    console.log('Database is connected')
  } else {
    console.log('Error connecting to database', err)
  }
})

var app = express()
app.set('views', `${__dirname}/views`)
app.set('view engine', 'mustache')
app.engine('mustache', mustacheExpress())
app.use(bodyParser.urlencoded({extended: true}))

let playerStatsQuery = 'SELECT *,(goals+assists) AS points '
  + 'FROM player_stats '
  + 'INNER JOIN teams USING (teamId) '
  + 'ORDER BY points DESC'
app.get('/', function(req, res) {
  connection.query(playerStatsQuery, function(err, rows, fields) {
    if (!err) {
      console.log(rows)
      res.render('playerStats', {
        pageTitle: 'Player Stats',
        data: rows
      })
    } else {
      console.log('Error', err)
    }
  })
})

var port = 3000
app.listen(port, function() {
  console.log('Server started on port', port)
})

