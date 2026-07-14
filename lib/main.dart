import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/screen/sign_in_screen.dart';
import 'package:chat_app/screen/sign_up_screen.dart';
import 'package:chat_app/screen/welcom_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: const ChatScreen(),
     initialRoute: WelcomScreen.welcomscreen,
      routes: {
      WelcomScreen.welcomscreen: (context)=>WelcomScreen(),
         SignInScreen.sigInrouting: (context)=>SignInScreen(),
       SignUpScreen.sigUprouting : (context)=>SignUpScreen(),
          ChatScreen.chatrouting: (context)=>ChatScreen(),
      },
    );
  }
}
