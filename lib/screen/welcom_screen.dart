import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/screen/sign_in_screen.dart';
import 'package:chat_app/screen/sign_up_screen.dart';
import 'package:chat_app/widget/botton_widget.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatelessWidget {
  static const String welcomscreen = " welcom_screen";
  const WelcomScreen({super.key});

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
            'MessageMe',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.blue),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomBottomWidget(
              text: 'Sin In',
              colortext: AppColors.lightSurface,
              onTap: () {
                Navigator.pushNamed(context, SignInScreen.sigInrouting);
              }),
          CustomBottomWidget(
            text: 'Sin Up',
            colortext: AppColors.lightSurface,
            backgroundColor: AppColors.orange,
            onTap: () {
              Navigator.pushNamed(context, SignUpScreen.sigUprouting);
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
