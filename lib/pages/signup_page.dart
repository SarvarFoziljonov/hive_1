import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_project/pages/login_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp extends StatefulWidget {
  static final String id = "signup_page";
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void _doSignup () {
  String user = userNameController.text.toString().trim();
  String email = emailController.text.toString().trim();
  String phone = phoneController.text.toString().trim();
  String password = passwordController.text.toString().trim();

  var box = Hive.box('my_box');
  box.put("user", user);
  box.put("email", email);
  box.put("phone", phone);
  box.put("password", password);

  String _user = box.get("user");
  String _email = box.get("email");
  String _phone = box.get("phone");
  String _pw = box.get("password");

  print(_user);
  print(_email);
  print(_phone);
  print(_pw
  );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: HexColor("#07173c"),
      body: Container(
        padding: EdgeInsets.all(20),
        color: HexColor("#07173c"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Create", style: TextStyle(color: Colors.white, fontSize: 30),),
            Text("Account", style: TextStyle(color: Colors.white, fontSize: 30),),
            SizedBox(height: 70,),
            // user name
            TextField(
              controller: userNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person_outline, color: Colors.white,),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )
              ),
            ),
            SizedBox(height: 20,),
            // e-mail
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.mail, color: Colors.white,),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )
              ),
            ),
            SizedBox(height: 20,),
            // phone number
            TextField(
              controller: phoneController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.phone, color: Colors.white,),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )
              ),
            ),
            SizedBox(height: 20,),
            //password
            TextField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock_open_sharp, color: Colors.white,),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )
              ),
            ),
            SizedBox(height: 20,),
            // forgot password
            GestureDetector(
              onTap: () {},
              child: Text("Forgot Password?",style: TextStyle(color: Colors.grey, fontSize: 15),),
            ),
            SizedBox(height: 60,),
            // button
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.blue.withOpacity(0.6),
                      Colors.blue.withOpacity(0.4),
                    ],
                  ),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: _doSignup,
                    icon: Icon(Icons.arrow_forward,color: Colors.white, size: 40,),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            //signup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(color: Colors.grey, fontSize: 18),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, LogIn.id);
                  },
                  child: Text("Sign In", style: TextStyle(color: Colors.blue, fontSize: 18),),
                ),
              ],
            ),
            SizedBox(height: 50,),



          ],
        ),
      ),
    );
  }
}
