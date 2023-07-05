import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'signup.dart';
import 'otp.dart';
import 'authutils.dart';
import 'forgotpasword.dart';

class Login extends StatefulWidget{
  const Login({Key ? key}): super(key : key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //password boolean
  bool isVisible = false;

  //login method
  Future Login() async{
    // showDialog(
    //     context: context,
    //     barrierDismissible: true,
    //     builder:(context){
    //       return Center(child: CircularProgressIndicator());
    //     }
    // );
 
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }on FirebaseAuthException catch(e){
      print(e);
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepPurpleAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );

      //AuthUtils.showSnackBar(e.message);
    }
  }


  //google sign in
  GoogleSignIn() async{
    //begin signin process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //get user auth details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create new user credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);

  }

  //disposing controllers to help with memory management
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
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
                      'Welcome Back',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
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
                            contentPadding: EdgeInsets.all(15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 0.8, color: Colors.black54),
                            ),
                            //hintStyle: TextStyle(color: Color(0xFF6BB389)),
                            hintText: 'Email Address',
                            prefixIcon: IconButton(icon: Icon(Icons.person, size: 28.0,), onPressed:(){} ,),
                            suffixIcon:IconButton(icon:Icon(Icons.clear,), onPressed: () => emailController.clear(),)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 25,),

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
                              borderSide: BorderSide(width: 0.8, color: Colors.black54,),
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

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword())),
                        child: Text(
                            'forgot password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF240C14),
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                    onPressed: () => Login(),
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        color: Color(0xFF6BB389),
                      )
                    ),
                  ),

                  SizedBox(height: 3,),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup())),
                      child: Text('Dont have an account?', style: TextStyle(color: Colors.black54),),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton.icon(
                        label: Text('Gmail', style: TextStyle(color: Colors.black54,),),
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.black54,
                        ),
                        onPressed: () => GoogleSignIn(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(90,50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                        ),
                      ),



                      ElevatedButton.icon(
                        label: Text('Phone', style: TextStyle(color: Colors.black54,),),
                        icon: FaIcon(
                          FontAwesomeIcons.phone,
                          color: Colors.black54,
                        ),
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTP())),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(90,50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),

                        ),
                      ),
                    ],
                  ),


           ]
          ),
        ),
    ),

    )
    )
    );
  }
}
