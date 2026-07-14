import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/widget/botton_widget.dart';
import 'package:chat_app/widget/text_filed_wedgit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String sigUprouting = " Sign_Up_screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  late String emaile;
  bool isLoading = false;

  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(
            flex: 4,
          ),
          Image.asset(
            AppAssets.image2,
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
          const Text(
            'Sin UP',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.orange),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFiled(
            hinttext: " enter your emaile",
            labl: " Emaile",
            colorborder: AppColors.orange,
            textInputType: TextInputType.emailAddress,
            onChanged: (value) {
              emaile = value;
            },
          ),
          CustomTextFiled(
            hinttext: " enter your password",
            labl: " Password",
            colorborder: AppColors.orange,
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomBottomWidget(
            text: 'Sin Up',
            colortext: AppColors.lightSurface,
            backgroundColor: AppColors.orange,
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              try {
                final authuser = await _auth.createUserWithEmailAndPassword(
                    email: emaile, password: password);
                Navigator.pushNamed(context, ChatScreen.chatrouting);
                 setState(() {
                isLoading = false;
              });
              } catch (e) {
                print(e.toString());
                // TODO
              }
            },
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
    ;
  }
}
