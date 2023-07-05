import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ForgotPassword extends StatefulWidget{
  const ForgotPassword({Key ? key}): super(key : key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>{
  //email text controller
  final emailController = TextEditingController();

  //firebase auth instance
  final _auth = FirebaseAuth.instance;

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  //reset password method
  Future ResetPassword(email) async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              content: Text('Password reset link sent, Please check your email.'),
            );
          }
      );

    } on FirebaseAuthException catch (e){
      print(e);
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF240C14),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Please enter your email so we can send your reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
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
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
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

          SizedBox(height: 15,),


          ElevatedButton(
            onPressed: () => ResetPassword(emailController.text.trim()),
            child: Text('Reset'),
            style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  color: Color(0xFF6BB389),
                )
            ),
          ),
        ],
      ),
    );
  }
}
