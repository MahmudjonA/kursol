import 'package:flutter/material.dart';

import '../../../../core/common/colors/app_colors.dart';
import '../../../../core/common/constants/app_string.dart';
import '../../../../core/common/widgets/default_app_bar_wg.dart';
import '../../../../core/responsiveness/app_responsive.dart';
import '../widgets/transactions_card_wg.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: DefaultAppBarWg(
        titleText: AppStrings.transactions,
        onMorePressed: () {},
        onSearchPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(24)),
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: appH(44)),
            itemCount: 1, // dummy code
            itemBuilder: (context, index) => TransactionsCardWg(
              onTap: () {},
              onButtonPressed: () {
                // context.pushNamed(RouteNames.eReceipt);
              },
              title: "Flutter Mobile Apps",
              courseImg: "assets/images/img.png",
            ),
          ),
        ),
      ),
    );
  }
}
