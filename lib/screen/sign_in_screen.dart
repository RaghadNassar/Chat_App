import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/widget/botton_widget.dart';
import 'package:chat_app/widget/text_filed_wedgit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String sigInrouting = " Signin_screen";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final _auth = FirebaseAuth.instance;
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
            AppAssets.image1,
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
          const Text(
            'Sin In',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.blue),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFiled(
            hinttext: " enter your emaile",
            labl: " Emaile",
            textInputType: TextInputType.emailAddress,
            onChanged: (value) {
              emaile = value;
            },
          ),
          CustomTextFiled(
            hinttext: " enter your password",
            labl: " Password",
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomBottomWidget(
            text: 'Sin In',
            colortext: AppColors.lightSurface,
            onTap: () async {
              setState(() {
                isLoading = true;
              });
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: emaile, password: password);
                if (user != null) {
                  Navigator.pushNamed(context, ChatScreen.chatrouting);
                }
                setState(() {
                isLoading = false;
              });
              } catch (e) {
                print(e);
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
  }
}
