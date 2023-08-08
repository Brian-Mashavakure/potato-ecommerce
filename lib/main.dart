import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'pages/welcomepage.dart';
import 'pages/authentication/authutils.dart';
import 'pages/widgets/navbar.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  MyApp({super.key,});

  //swatch color
  // final Color myColor = Color(0xFF972D07);
  // final MaterialColor swatchColor = MaterialColor(
  //   0xFF972D07,
  //   <int, Color>{
  //     50: Color(0xFFFFE6E0),
  //     100: Color(0xFFFFCDBA),
  //     200: Color(0xFFFFAF8F),
  //     300: Color(0xFFFF8F63),
  //     400: Color(0xFFFF7136),
  //     500: Color(0xFF972D07),
  //     600: Color(0xFF6F2106),
  //     700: Color(0xFF4C1704),
  //     800: Color(0xFF2A0B02),
  //     900: Color(0xFF0B0000),
  //   },
  // );

  final Color myColor = Color(0xFF321325);
  final MaterialColor swatchColor = MaterialColor(0xFF321325, {
    50: Color(0xFFEAE4E4),
    100: Color(0xFFC4B9BA),
    200: Color(0xFF9D8E90),
    300: Color(0xFF765F65),
    400: Color(0xFF573F45),
    500: Color(0xFF321325), // Primary color
    600: Color(0xFF2E111E),
    700: Color(0xFF290F19),
    800: Color(0xFF240C14),
    900: Color(0xFF1B080B),
  });

  //instantiating auth utils class
  final authUtilsObj = new AuthUtils();

  //firebase user
  final _user = FirebaseAuth.instance.currentUser;


  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: authUtilsObj.messengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: swatchColor,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black54)),
      ),
      home:StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return NavBar();
            }else{
              return WelcomePage();
            }
          },
        ),



    );
  }
}

