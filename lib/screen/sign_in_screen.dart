import 'package:chat_app/core/constans/app_assets.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/widget/botton_widget.dart';
import 'package:chat_app/widget/text_filed_wedgit.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
         const  SizedBox(height: 30,),
         const CustomTextFiled(hinttext:" enter your emaile" ,labl:" Emaile" ,),
          const CustomTextFiled(hinttext:" enter your password" ,labl:" Password" ,),
           const  SizedBox(height: 30,),
          CustomBottomWidget(text: 'Sin In', colortext: AppColors.lightSurface),
          
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}