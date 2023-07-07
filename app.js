var express = require('express');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');
var expressSession = require('express-session');
var db = require('./db');
//var hbs = require('express-handlebars');
var path = require('path');
var mysql= require('mysql2');
var async = require('async');

var admin = require('./routes/admin');
var app = express();

//configuration
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
//app.engine('hbs', hbs({defaultLayout: 'main'}));

//app.set('view engine', 'hbs');
//use middleware
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());
app.use(expressValidator());
app.use(expressSession({
  secret: 'ATP3',
  saveUninitialized: false,
  resave: false
}));


app.use(express.static('./public'));



// typeahead

// var connection = mysql2.createConnection({
//   host: 'localhost',
//   user: 'root',
//   port: '3306',
//   password: 'root',
//   database: 'pharmacy'
// });




var connection=mysql.createConnection({
  host:'localhost',
  port: '3307',
  user:'root',
  password:'',
  database:'pharmacy'
});
 connection.connect();

connection.connect(function(error){
  if(!!error){
    console.log(error);
  }else{
    console.log('Connected!:)');
  }
});





app.get('/search', function (req, res) {
  connection.query('SELECT Medicine_Name from medicine_information where Medicine_Name like "%' + req.query.key + '%"', function (err, rows, fields) {
    if (err) throw err;
    var data = [];
    for (i = 0; i < rows.length; i++) {
      data.push(rows[i].Medicine_Name);
    }
    res.end(JSON.stringify(data));
  });
});


// Routes
app.get('/', function (req, res) {
  res.render('view_login', {
    title: 'Login Panel',
    message: '',
    message_type: '',
    errors: ''
  });
});

app.post('/', function (req, res) {


  //login validations
  req.checkBody('username', 'Username is required').notEmpty();
  req.checkBody('password', 'Password is required').notEmpty();

  req.getValidationResult().then(function (result) {
    if (!result.isEmpty()) {
      res.render('view_login', {
        title: 'Login Panel',
        message: '',
        message_type: '',
        errors: result.array(),
        user: req.session.loggedUser,
      });

    } else {
      var user = {
        username: req.body.username,
        password: req.body.password,
        UserType: ''
      }

      var query = "SELECT * FROM user_access WHERE username = ? AND password = ?";
      db.getData(query, [user.username, user.password], function (rows) {
        console.log(rows[0]);
        if (!rows[0]) {
          res.render('view_login', {
            title: 'User Login',
            message: 'Login Failed! Enter Correct Infromatins.',
            message_type: 'alert-danger',
            errors: ''
          });
        } else {
          if (rows[0].Usertype == 'Admin') {

            user.UserType = 'Admin';
            req.session.loggedUser = user;

            res.redirect('/admin');

          } else if (rows[0].Usertype == 'Staff') {

            user.UserType = 'Staff';
            req.session.loggedUser = user;

            res.redirect('/admin');

          }
        }
      });

    } // validation end

  });

});



app.get('/admin', function (req, res) {

  if (!req.session.loggedUser) {
    res.redirect('/');
    return;
  }


  // IMPORTANT ROUTING NOTE ******************************
  // add the below code in admin.js => router.get('/')  **
  // exectly same code needs there to work properly     **
  // *****************************************************

//   var connection = mysql2.createConnection({
//     host: 'localhost',
//     user: 'root',
//     port : '3306',
//     password: '',
//     database: 'pharmacy'
// });

// var connection=mysql.createConnection({
//   host:'localhost',
//   port: '3307',
//   user:'root',
//   password:'',
//   database:'pharmacy'
// });

// connection.connect(function(error){
//   if(!!error){
//     console.log(error);
//   }else{
//     console.log('Connected!:)');
//   }
// });







var totalSell = "select ROUND(SUM(Total_Payable),2) AS sells_count from bill_information";
var todaySell = "select ROUND(SUM(Total_Payable),2) AS sells_count_today from bill_information where Date = CURDATE()";
var totalUser = "SELECT COUNT(*) AS users_count FROM user_information";
var totalBatch = "SELECT COUNT(*) AS batch_count FROM batch";
var totalMedicine = "SELECT COUNT(*) AS med_count FROM medicine_information";
var totalSupplier = "SELECT COUNT(*) AS sup_count FROM supplier";
var totalCategory = "SELECT COUNT(*) AS cat_count FROM category";
var totalGeneric = "SELECT COUNT(*) AS generic_count FROM drug_generic_name";
var totalManufac = "SELECT COUNT(*) AS manufac_count FROM manufacturer";

async.parallel([
    function (callback) {
        connection.query(totalSell, callback)
    },
    function (callback) {
        connection.query(todaySell, callback)
    },
    function (callback) {
        connection.query(totalUser, callback)
    },
    function (callback) {
        connection.query(totalBatch, callback)
    },
    function (callback) {
        connection.query(totalMedicine, callback)
    },
    function (callback) {
        connection.query(totalSupplier, callback)
    },
    function (callback) {
        connection.query(totalCategory, callback)
    },
    function (callback) {
        connection.query(totalGeneric, callback)
    },
    function (callback) {
        connection.query(totalManufac, callback)
    }
], function (err, rows) {


    console.log(rows[0][0]);
    console.log(rows[1][0]);
    console.log(rows[2][0]);


    // those data needs to be shown on view_admin.ejs
    // Dashboard page requires those data
    // NOT WORKING PROPERLY

    res.render('view_admin', {
        'totalSell': rows[0][0],
        'todaySell': rows[1][0],
        'totalUser': rows[2][0],
        'totalBatch': rows[3][0],
        'totalMedicine': rows[4][0],
        'totalSupplier': rows[5][0],
        'totalCategory': rows[6][0],
        'totalGeneric': rows[7][0],
        'totalManufac': rows[8][0],
        'user': req.session.loggedUser
    });
});



});

app.get("/search.html",function(req,res){
  res.sendFile(__dirname+"/views/search.html")
})
app.get("/about.html",function(req,res){
  res.sendFile(__dirname+"/views/about.html")
})
app.get("/contact_us.html",function(req,res){
  res.sendFile(__dirname+"/views/contact_us.html")
})
app.get("/forgot_password.html",function(req,res){
  res.sendFile(__dirname+"/views/forgot_password.html")
})



// routes
app.use('/admin', admin);



// Handle form submission
app.post('/contact', (req, res) => {
  const fullName = req.body.fullName;
  const email = req.body.email;
  const message = req.body.message;

  // Insert the form data into the "contact" table
  const query = `INSERT INTO contact (fullName, email, message) VALUES (?, ?, ?)`;
  connection.query(query, [fullName, email, message], (err, result) => {
    if (err) {
      console.error('Error inserting data into the table: ', err);
      // Render an error page or redirect to an error URL
      // res.render('error');
      // return;
    }
    // Render a success page or redirect to a success URL
    // res.render('Your resp')
    res.redirect('/contact_us.html');
    // res.send('Its Done');
    // res.send('<script>alert("It\'s done");</script>');

  });
});


app.post('/forgot_password', (req, res) => {
  // const fullName = req.body.fullName;
  const email = req.body.email;
  // const message = req.body.message;

  // Insert the form data into the "contact" table
  const query = `INSERT INTO forgot_password (email) VALUES (?)`;
  connection.query(query, [email], (err, result) => {
    if (err) {
      console.error('Error inserting data into the table: ', err);
      // Render an error page or redirect to an error URL
      // res.render('error');
      // return;
    }
    // Render a success page or redirect to a success URL
    // res.render('Your resp')
    res.redirect('/view_login');
    // res.send('Its Done');
    // res.send('<script>alert("It\'s done");</script>');

  });
});

//start the server
app.listen(8000, function () {
  console.log('server started at port 8000');
});

module.exports = app;