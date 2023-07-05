import 'package:flutter/material.dart';


import 'authentication/signup.dart';
import 'authentication/login.dart';

class WelcomePage extends StatefulWidget{
  const WelcomePage({Key ? key}): super(key : key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'icons/welcomepage.jpg',
            ),
            fit: BoxFit.fitHeight,
            opacity: 6.5,
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                 Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     Center(
                       child: Text(
                         'Hey Welcome!',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 30,
                         ),
                       ),
                     ),

                     SizedBox(height: 10,),

                     Center(
                       child: Text(
                         'Sell anything and everything',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 19,
                         ),
                       ),
                     ),

                   ],
                 ),


                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login())),
                        child: Text('Get Started'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          minimumSize: Size(150, 50),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5,),

                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup())),
                      child: Text('Dont have an account?'),
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
