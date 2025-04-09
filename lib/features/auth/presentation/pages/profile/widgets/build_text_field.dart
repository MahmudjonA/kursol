import 'package:flutter/material.dart';

import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';

Widget buildTextField(String label, {IconData? suffixIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyScale.grey50,
          hintText: label,
          hintStyle: AppTextStyles.urbanist.regular(
            color: AppColors.greyScale.grey500,
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          suffixIconColor: AppColors.greyScale.grey500),
      style: AppTextStyles.urbanist.semiBold(
        color: AppColors.greyScale.grey900,
        fontSize: 14,
      ),
    ),
  );
}
