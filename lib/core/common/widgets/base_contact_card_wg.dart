import 'package:flutter/material.dart';
import '../../responsiveness/app_responsive.dart';
import '../../text_styles/urbanist_text_style.dart';
import '../colors/app_colors.dart';

class BaseContactCardWg extends StatelessWidget {
  final String imagePath;
  final String name;
  final String subtitle;
  final Widget trailing;

  const BaseContactCardWg({
    super.key,
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appH(60),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: appH(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: appW(20),
            children: [
              CircleAvatar(
                radius: appH(30),
                backgroundImage: AssetImage(imagePath), // загружаем изображение
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: UrbanistTextStyles().bold(
                      fontSize: 18,
                      color: AppColors.greyScale.grey900,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: UrbanistTextStyles().medium(
                      fontSize: 14,
                      color: AppColors.greyScale.grey700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
