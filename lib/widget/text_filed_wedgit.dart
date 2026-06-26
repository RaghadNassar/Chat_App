import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.onChanged,
    this.obscureText = false,
    this.hinttext,
    this.labl,
    this.color,
    this.colorborder,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.textcontroler,
    this.maxlines = 1,
    this.onSave,
    this.onTap,
    this.onTapSuffixIcon,
    this.readOnly = false,
    this.validate,
  });

  final Function(String)? onChanged;
  final void Function(String?)? onSave;
  final String? hinttext;
  final String? labl;
  final bool obscureText;
  final Color? color;
  final Color? colorborder;
  final bool readOnly;
  final int? maxlines;
  final VoidCallback? onTap;
  final VoidCallback? onTapSuffixIcon;
  final TextInputType? textInputType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? textcontroler;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labl != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                labl!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blue,
                ),
              ),
            ),
          ],
          TextFormField(
            onTap: onTap,
            readOnly: readOnly,
            onSaved: onSave,
            maxLines: maxlines,
            obscureText: obscureText,
            controller: textcontroler,
            keyboardType: textInputType,
            validator: validate ??
                (data) {
                  if (data?.trim().isEmpty ?? true) {
                    return 'Field is required';
                  }
                  return null;
                },
            onChanged: onChanged,
            style: const TextStyle(color: AppColors.blue, fontSize: 15),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.lightSurface,

              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),

              prefixIcon: prefixIcon != null
                  ? Icon(prefixIcon, color: AppColors.blue, size: 22)
                  : null,

              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon, color: AppColors.blue, size: 18),
                      onPressed: onTapSuffixIcon,
                    )
                  : null,

              hintText: hinttext,
              //  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color:Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5)), // لون خافت للنص التلميحي

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.blue, width: 0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue.withOpacity(0.1)),
                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.error, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
