import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/buttons/default_button_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/app_tex_style.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: "Edit Profile",
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: appW(24),
          left: appW(24),
          top: appH(24),
          bottom: appH(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: appH(24),
              children: [
                _blankContainer(Text("Iftikhor Rustamov", style: _textStyle)),
                _blankContainer(Text("Iftikhor", style: _textStyle)),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("12/12/2012", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.calendar, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("iftixorrustamovv@gmail.com", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.message, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("United Kingdom", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyBold.arrow_down_2, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  Row(
                    children: [
                      Image.asset("assets/images/usa.png"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, size: appH(20)),
                      ),
                      Text("+998 90 200 40 20", style: _textStyle),
                    ],
                  ),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("Male", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyBold.arrow_down_2, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(Text("Student", style: _textStyle)),
              ],
            ),
            DefaultButtonWg(title: "Update", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget _rowSpaceBetween(List<Widget> widgets) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: widgets);

final _textStyle = AppTextStyles.urbanist.semiBold(
  color: AppColors.greyScale.grey900,
  fontSize: 14,
);

Widget _blankContainer(Widget widget) => Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      width: double.infinity,
      height: appH(56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyScale.grey50,
      ),
      child: widget,
    );
