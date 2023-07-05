import 'package:flutter/material.dart';
import 'package:r11seproject/initialscreens/initialscreens.dart';
import 'package:r11seproject/screens/sellers/loginsignup/sellerlogin.dart';
import 'package:r11seproject/screens/sellers/loginsignup/sellersignup.dart';
import 'package:r11seproject/screens/users/userhomepage/userhomepage.dart';
import 'package:r11seproject/screens/users/loginsignup.dart/userlogin.dart';
import 'package:r11seproject/screens/users/loginsignup.dart/usersignup.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => InitialScreen(),
  '/userlogin': (context) => UserLogin(),
  '/usersignup': (context) => UserSignup(),
  '/sellerlogin': (context) => SellerLogin(),
  '/sellersignup': (context) => SellerSignup(),
  '/userhome': (context) => UserHome(),
};
var localhost = "192.168.10.62";
//user folder all url
var userLoginurl =
    "http://$localhost/php/FlutterEcommerce/users/index.php"; //post methods'email','password' are used to login
var userSignupurl =
    "http://$localhost/php/FlutterEcommerce/users/usersignup.php"; //post methods 'full_name','address','phone_number','email','password' are used to signup
var displayproducturl =
    "http://$localhost/php/FlutterEcommerce/users/displayproduct.php"; // post methods 'a','b','c' are used to display products
//sellers folder all url