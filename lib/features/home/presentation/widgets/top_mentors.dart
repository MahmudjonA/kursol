import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../../../../core/text_styles/urbanist_text_style.dart';

Widget columnWg(String imagePath, String name) {
  return Container(
    margin: EdgeInsets.only(right: appW(15)),
    child: Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
              errorWidget:
                  (context, url, error) => Icon(
                    IconlyBold.user_3,
                    color: AppColors.greyScale.grey400,
                    size: appH(50),
                  ),
            ),
          ),
        ),

        SizedBox(height: appH(8)),
        Text(
          name,
          style: UrbanistTextStyles().semiBold(
            fontSize: 16,
            color: AppColors.greyScale.grey900,
          ),
        ),
      ],
    ),
  );
}
