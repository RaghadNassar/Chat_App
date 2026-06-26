import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomWidget extends StatelessWidget {
  final String text;
  VoidCallback? onTap;
  final Color? backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double? width;
  final double? hight;
  final bool isLoading;
  final double borderradius;
  final IconData? icon;
  final Border? border;

  CustomBottomWidget({
    required this.text,
    this.onTap,
    this.icon,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.fontSize = 20,
    this.fontWeight = FontWeight.normal,
    this.width,
    this.hight = 50,
    this.isLoading = false,
    this.borderradius = 18,
    Key? key,
    required Color colortext,
    final int? fontsize,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.blue,
            borderRadius: BorderRadius.circular(borderradius),
            border:
                border ?? Border.all(color: AppColors.blue.withOpacity(0.3)),
          ),
          width: width ?? double.infinity,
          height: hight,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
          //  ),
        ),
      ),
    );
  }
}
