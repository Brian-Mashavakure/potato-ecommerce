import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';
import 'authutils.dart';

class Signup extends StatefulWidget{
  const Signup({Key ? key}): super(key : key);

  @override
  State<Signup> createState() => _SignupState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _SignupState extends State<Signup>{
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();


  //user roles
  String? userRole;

  List Roles = [
    'Seller', 'Buyer'
  ];

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
  Future SignUp() async{
    //progress indicator while waiting for login
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) =>
    //         Center(
    //           child: CircularProgressIndicator(),
    //         )
    // );
    try {

      if(confirmPassword()) {
        //create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        //add user role
        AddUserRole('Buyer');
      }

    } on FirebaseAuthException catch (e) {

      //AuthUtils.showSnackBar(e.message);
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );
      
    }
    //hide progress indicator after login
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future AddUserRole(String role) async{
    await FirebaseFirestore.instance.collection('userRoles').add({
      'User Role': role,
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

                  SizedBox(height: 150,),


                  Center(
                    child: Text(
                      'Lets Get You Started!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  SizedBox(height: 35,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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

                  SizedBox(height: 20,),


                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(width: 0.8, color: Colors.black54),
                        ),
                        child: DropdownButton(
                          hint: Text('Select User Role'),
                          dropdownColor: Colors.white30,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 25,
                          underline: SizedBox(),
                          isExpanded: true,
                          value: userRole,
                          onChanged: (newValue){
                            setState(() {
                              newValue = userRole;
                            });
                          },
                          items: Roles.map((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      )
                    ),
                  ),

                  SizedBox(height: 20,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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

                  SizedBox(height: 20,),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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


                  SizedBox(height: 35,),

                  ElevatedButton(
                    onPressed: () => SignUp(),
                    child: Text('Create Account'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        //color: Color(0xFF6BB389),
                      )
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

                  SizedBox(height: 30,),

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.google,
                                    color: Colors.black54,
                                  ),

                                  SizedBox(width: 5,),

                                  Text('Continue With Google', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),),

                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Center(
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.black54,
                                  ),

                                  SizedBox(width: 5,),

                                  Text('Continue With Facebook', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black54),),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
