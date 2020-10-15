var express=require('express');
var app=express();
var fs = require('fs');
app.set('view engine','ejs');
require('dotenv').config();
var debug = require('debug')('http');
var morgan = require('morgan');
var path = require('path');
var cookieParser = require('cookie-parser');
var router = express.Router();
var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended:true})); // support encoded bodies
app.use('/assets', express.static('./public'));
var nodemailer = require('nodemailer');
fileUpload = require('express-fileupload')
// var mysqlAdmin = require('node-mysql-admin');
// app.use(mysqlAdmin(app));
 var transporter = nodemailer.createTransport({
  host: 'smtp.ethereal.email',
  port: 2525,
  service: 'gmail',
  auth: {
    user: 'helpify123@gmail.com',
    pass: '02512609841'
  }
});

var mysql = require('mysql');
var con = mysql.createConnection({
 host: "bg2rzlbwqqu9pzkzlglw-mysql.services.clever-cloud.com",
 user: "ufvygepnzkvxzis3",
 password: "iq3kmajkJs67oNYUTro6",
 database:"bg2rzlbwqqu9pzkzlglw"
});



app.use(express.static(__dirname + '/public'));

 con.connect(function(err) {
  if (err) throw  err;
  console.log("connected");});

var mysqlAdmin = require('node-mysql-admin');

app.use(mysqlAdmin(app));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname,'index.html'));
});
app.get('/admin', function(req,res) {
  var err=false;
  var corr=false;
  res.render('admin1',{err:err});
  // body...
});
app.get('/student/add', function(req,res) {
res.sendFile(path.join(__dirname,'/infor.html'));

});
app.post('/student', function(req,res) {
var fname = req.body.fname;
var lname = req.body.lname;
var date=req.body.date;
var age=req.body.age;
var email=req.body.email;
var phone=req.body.phone;
var studentdob=req.body.studentdob;
var studentmarksheet=req.body.studentmarksheet;
var addc=req.body.addc;
var sql = "INSERT INTO data (firstname,lastname,phoneno,email,age,dob,dobc,markc,addc) VALUES ('"+req.body.fname+"','"+req.body.lname+"','"+req.body.phone+"','"+req.body.email+"','"+req.body.age+"','"+req.body.date+"','"+req.body.dobc+"','"+req.body.studentmarksheet+"','"+req.body.addc+"')";
  con.query(sql, function(err, result)  {
    console.log(date)
   if(err) throw err;
});
  res.sendFile(path.join(__dirname,'main.html'));
});

app.post('/admin', function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  console.log(username);
  console.log(password);
    con.query('SELECT * FROM admin WHERE username= ? AND password = ?', [username, password], function(err, result, fields) {
      if (err) throw err;
      
      if (result.length > 0) {
        console.log(result)
        res.redirect("/req")
      } else {
        console.log('error')
        var err=true;
        res.render('admin1',{err:err})
      }     
    });

});
app.get('/req', (req, res) => {
   con.query('SELECT * FROM data ', function(err, result, fields) 
   {
      if (err) throw err;
      if (result.length > 0) 
      {
        console.log(result);
        var err=true;
        var corr=false;
        res.render('req1',{err:err,data:result,corr:corr});
      } 
      else 
      {
        var err=false;
        var corr=true;
        res.render('req1',{err:err,corr:corr});
      }     
    });


});

app.get('/fee', function(req,res) {
  var err=false;
  var corr=false;
  res.render('feel',{err:err});
  // body...
});
app.post('/fee', function(req, res) {
  var username = req.body.username;
  var password = req.body.password;
  console.log(username);
  console.log(password);
    con.query('SELECT * FROM studentfee WHERE username= ? AND password = ?', [username, password], function(err, result, fields) {
      if (err) throw err;
      
      if (result.length > 0) 
      {
        console.log(result)
        res.redirect('/fee/'+username);
        
      } 
      else 
      {
        console.log('error')
        var err=true;
        res.render('feel',{err:err})
      }     
    });

});
app.get('/fee/:_id', function(req,res) {
  res.sendFile(path.join(__dirname,'/money.html'));
  // body...
});
function convert(str) {
  var date = new Date(str),
    mnth = ("0" + (date.getMonth() + 1)).slice(-2),
    day = ("0" + date.getDate()).slice(-2);
  return [date.getFullYear(), mnth, day].join("-");
}

app.post('/schooldata/:_id', function(req,res) {
var id=req.params._id;
 con.query('SELECT * FROM fee WHERE id = ?',[id], function(err, result, fields)
 {var d=convert(result[0].dob)
  console.log(d);
  var sql = "INSERT INTO schooldata (firstname,lastname,phoneno,email,age,dob,dobc,markc,addc) VALUES ('"+result[0].firstname+"','"+result[0].lastname+"','"+result[0].phoneno+"','"+result[0].email+"','"+result[0].age+"','"+d+"','"+result[0].dobc+"','"+result[0].markc+"','"+result[0].addc+"')";
  con.query(sql, function(err, result)  {
   if(err) throw err;
});
con.query('DELETE FROM studentfee WHERE username = ? ',[id], function (err, result) {
  if (err) throw err;
  console.log(result);
});
con.query('DELETE FROM fee WHERE id = ? ',[id], function (err, result) {
  if (err) throw err;
  console.log(result);
}); 
 });


res.redirect('/')
});









app.post('/delete/:_id', function(req, res, next){
var ser=req.params._id;
console.log(ser)
con.query('SELECT * FROM data WHERE id =  ?', [ser], function(err, result, fields) {
      if (err) throw err;
var mailOptions = {
    from: 'helpify123@gmail.com',
    to:result[0].email,
    subject: 'Sorry we could not approve your request',
    text: 'The information provided by you  has some invalid information which is restricting us to coordinate with your team. Do recheck the information you have provided.'
    }  
      
// console.log(Object.assign({}, mailOptions)); 
  transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
});


con.query('DELETE FROM data WHERE id = ? ',[ser], function (err, result) {
  if (err) throw err;
  console.log(result);
}); 
res.redirect('/req')
});


app.post('/acc/:_id', function(req, res, next)
{
var ser=req.params._id;
  con.query('SELECT * FROM data WHERE id =  ?', [ser], function(err, result, fields) 
  {

       var d=convert(result[0].dob)

       var sql = "INSERT INTO fee (firstname,lastname,phoneno,email,age,dob,dobc,markc,addc) VALUES ('"+result[0].firstname+"','"+result[0].lastname+"','"+result[0].phoneno+"','"+result[0].email+"','"+result[0].age+"','"+d+"','"+result[0].dobc+"','"+result[0].markc+"','"+result[0].addc+"')";
       con.query(sql, function(err, result) 
        {
        console.log("i am query1")
        if(err) throw err;
        });
       
    

  con.query('SELECT max(id) as bhagyashri FROM fee', function(err, result, fields) 
  {console.log("i am query2")

  con.query('SELECT * FROM fee where id = ? ', [result[0].bhagyashri], function(err, result, fields)
  {console.log("i am query3")
  var sql = "INSERT INTO studentfee (username,password) VALUES ('"+result[0].id+"','"+result[0].age+"')";
    con.query(sql, function(err, result)  
    {
      console.log("i am query4");
    if(err) throw err;
    });
  

  var mailOptions = 
  {
    from: 'helpify123@gmail.com',
    to:result[0].email,
    subject: 'Fee payment',
    text: 'You need to pay fee with username '+result[0].id+' and password'+ result[0].age +"After that your addmission will be confirmed."
  }  
  transporter.sendMail(mailOptions, function(error, info)
  {
    if (error) 
    {
      console.log(error);
    } 
    else 
    {
    console.log('Email sent: ' + info.response);
    }
 });
  

});
});
});
con.query('DELETE FROM data WHERE id = ? ',[ser], function (err, result) 
{
// console.log("i am query5");
if (err) throw err;
res.redirect("/req");
}); 

});




app.listen(3000);
console.log('you are listening to port 3000');

