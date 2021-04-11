import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';
import 'package:hive_project/pages/signup_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LogIn extends StatefulWidget {
  static final String id = "login_page";
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void _doLogin () {
    String email = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var box = Hive.box('my_box');
    box.put("email", email);
    box.put("password", password);

    String em = box.get('email');
    String pw = box.get('password');

    print (em);
    print (pw);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
        padding: EdgeInsets.all(20),
        color: HexColor("#081f44"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           // photo user
           Center(
             child: Container(
               height: 80,
               width: 80,
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   image: DecorationImage(
                     image: AssetImage("assets/images/user_3.jpg"),
                     fit: BoxFit.cover,
                   ),
               ),
             ),
           ),
           SizedBox(height: 20,),
           Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 30),),
           SizedBox(height: 10,),
            Text("Sign in to continue", style: TextStyle(color: Colors.white, fontSize: 20,),),
            SizedBox(height: 60,),
            // username
            TextField(
              controller: usernameController,
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
                    onPressed: _doLogin,
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
               Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 18),),
               SizedBox(width: 5,),
               GestureDetector(
                 onTap: (){
                   Navigator.pushReplacementNamed(context, SignUp.id);
                 },
                 child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 18),),
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
