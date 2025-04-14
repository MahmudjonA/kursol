import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/sizes/sizes.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/base_contact_card_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/app_tex_style.dart';

class ProfileInviteFriendsPage extends StatefulWidget {
  const ProfileInviteFriendsPage({super.key});

  @override
  State<ProfileInviteFriendsPage> createState() =>
      _ProfileInviteFriendsPageState();
}

class _ProfileInviteFriendsPageState extends State<ProfileInviteFriendsPage> {
  bool isInvited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText:"Invite Friends",
      ),
      body: Padding(
        padding: scaffoldPadding48,
        child: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) => BaseContactCardWg(
            imagePath: "assets/images/boy.png",
            name: "Rustamov Iftikhor",
            subtitle: "+998 90 180 20 40",
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  isInvited = !isInvited;
                });
              },
              child: Chip(
                backgroundColor:
                    isInvited ? AppColors.white : AppColors.primary(),
                shape: StadiumBorder(
                  side: BorderSide(color: AppColors.primary(), width: 2),
                ),
                label: Text(
                  isInvited ? "Invited" : "Invite",
                  style: AppTextStyles.urbanist.semiBold(
                    color: isInvited ? AppColors.primary() : AppColors.white,
                    fontSize: 14,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: appW(12),
                  vertical: appH(6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
