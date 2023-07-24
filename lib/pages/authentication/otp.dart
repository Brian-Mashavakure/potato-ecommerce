import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../home/homepage.dart';

class OTP extends StatefulWidget{
  const OTP({Key ? key}): super(key : key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP>{

  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  //boolean to be used to display OTP text field after phone number verification
  bool otpVisibility = false;
  final otpController = TextEditingController();
  final phoneController = TextEditingController();
  String verificationID = "";

  //method to verify phone number before code is sent
  void loginWithPhone() async {
    _auth.verifyPhoneNumber(
      phoneNumber: "+27" + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }


  //OTP auth function
  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await _auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.deepPurpleAccent,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login has failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
               SizedBox(height: 15,),
                
                Center(
                  child: Text(
                    'Login Using Phone NUmber',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 3,),

                Center(
                  child: Text(
                    'Verify OTP Code',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Phone NUmber',
                    suffixIcon: phoneController.text.isEmpty
                        ? Container(width:0)
                        : IconButton(
                      icon:Icon(Icons.close),
                      onPressed: () => phoneController.clear(),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 10,),

                Visibility(
                  child: TextFormField(
                    controller: otpController,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      hintText: 'OTP',
                      suffixIcon: otpController.text.isEmpty
                          ? Container(width:0)
                          : IconButton(
                        icon:Icon(Icons.close),
                        onPressed: () => otpController.clear(),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  visible: otpVisibility,
                ),

                SizedBox(height: 10,),

                ElevatedButton(
                  onPressed: (){
                    if(otpVisibility){
                      verifyOTP();
                    }else{
                      loginWithPhone();
                    }
                  },
                  child: Text(
                    otpVisibility? 'SUBMIT' : 'VERIFY',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF240C14),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
