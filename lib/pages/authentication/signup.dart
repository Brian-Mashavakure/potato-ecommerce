import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login.dart';
import 'otp.dart';
import 'authutils.dart';
import '../home/homepage.dart';

class Signup extends StatefulWidget{
  const Signup({Key ? key}): super(key : key);

  @override
  State<Signup> createState() => _SignupState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _SignupState extends State<Signup>{
  //constructor for using with the dropdown
  _SignupState(){
    userRole = _rolesList[0];
  }


  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();


  //user roles
  String? userRole;

  final _rolesList = ['Seller', 'Buyer'];

  //password boolean
  bool isVisible = false;
  bool confirmVisible = false;

  //confirm password
  bool confirmPassword(){
    if(passwordController.text == confirmController.text){
      return true;
    }else{
      return false;
    }
  }

  //signup user
  Future<void> SignUp( String email, String password) async{
    try {
      if(confirmPassword()){
        //creating user with custom UID
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

      }
    }on FirebaseAuthException catch (e){
      //Utils.showSnackBar(e.message);
      print(e.toString());
    }

    //hide progress indicator after login
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }








  Future AddUserRole() async{
    await FirebaseFirestore.instance.collection('userRoles').add({
      'User Role': userRole,
    });
  }




  //disposing controllers for memory management
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[



                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    child: Image.asset('icons/logo.jpg'),
                  ),




                  Center(
                    child: Text(
                      'Lets Get You Started!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all( 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 0.8, color: Colors.black54),
                            ),
                            //hintStyle: TextStyle(color: Color(0xFF6BB389)),
                            hintText: 'Email Address',
                            prefixIcon: IconButton(icon: Icon(Icons.person, size: 28.0,), onPressed:(){} ,),
                            suffixIcon: IconButton(icon:Icon(Icons.clear,), onPressed: () => emailController.clear(),)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(

                        value: userRole,
                        items: _rolesList.map(
                              (e){
                                return DropdownMenuItem(child: Text(e), value: e);
                              }
                          ).toList(),
                          onChanged: (val){
                          setState(() {
                            userRole = val as String;
                          });
                          },
                        icon: Icon(Icons.arrow_drop_down_circle_rounded),
                        dropdownColor:  Colors.white30,
                        decoration: InputDecoration(
                          labelText: "User Role",
                          contentPadding: EdgeInsets.all(15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8, color: Colors.black54),
                          ),
                          prefixIcon: Icon(Icons.person_2_rounded)
                        ),
                      ),
                    ),
                  ),


                 SizedBox(height: 18,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 0.8, color: Colors.black54),
                            ),
                            //hintStyle: TextStyle(color: Color(0xFF6BB389)),
                            hintText: 'Password',
                            prefixIcon: IconButton(icon: Icon(Icons.lock, size: 28.0,), onPressed:(){} ,),
                            suffixIcon: IconButton(
                              icon: isVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () => setState(() => isVisible = !isVisible),
                            ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 18,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all( 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0.8, color: Colors.black54),
                          ),
                          //hintStyle: TextStyle(color: Color(0xFF6BB389)),
                          hintText: 'Confirm Password',
                          prefixIcon: IconButton(icon: Icon(Icons.lock, size: 28.0,), onPressed:(){} ,),
                          suffixIcon: IconButton(
                            icon: confirmVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () => setState(() => confirmVisible = !confirmVisible),
                          ),
                        ),
                      ),
                    ),
                  ),


                  SizedBox(height: 33,),

                  ElevatedButton(
                    onPressed: () => SignUp(
                      emailController.text,
                      passwordController.text
                    ),
                    child: Text('Create Account'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        //color: Color(0xFF6BB389),
                      ),
                    ),
                  ),

                  SizedBox(height: 3,),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login())),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),





                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
