import 'package:flutter/material.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../../core/text_styles/app_tex_style.dart';

class BoardingWidget extends StatelessWidget {
  final String text;
  final String image;

  const BoardingWidget({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: appH(60)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: appH(60),
        children: [
          Image.asset(image, height: appH(320), width: appW(320)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.urbanist.bold(
              color: AppColors.greyScale.grey900,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
