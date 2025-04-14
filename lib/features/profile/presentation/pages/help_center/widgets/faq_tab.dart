import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../../../core/common/widgets/textfield/custom_text_field_wg.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import 'help_center_container_wg.dart';

class FaqTab extends StatefulWidget {
  const FaqTab({super.key});

  @override
  State<FaqTab> createState() => _FaqTabState();
}

class _FaqTabState extends State<FaqTab> {
  int selectedIndex = 0;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  final List<String> options = [
    "General",
    "Account",
    "Courses",
    "Payments",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: appH(24),
      children: [
        SizedBox(
          height: appH(40),
          child: ListView.builder(
            itemCount: options.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CustomChoiceChipWg(
              index: index,
              label: options[index],
              selectedIndex: selectedIndex,
              onSelected: (selected) {
                setState(() {
                  selectedIndex = selected ? index : selectedIndex;
                });
              },
            ),
          ),
        ),
        CustomTextFieldWg(
            isFocused: _isFocused,
            controller: _controller,
            focusNode: _focusNode,
            prefixIcon: IconlyLight.search,
            trailingWidget: IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.filter,
                size: 20,
                color: AppColors.primary.blue500,
              ),
            ),
            hintText: "Search",
            onTap: () {
              setState(() {
                _isFocused = true;
              });
            }),
        HelpCenterContainerWg(title: "What is Elera?", onPressed: () {}),
        HelpCenterContainerWg(title: "How to create Elera?", onPressed: () {}),
        HelpCenterContainerWg(
          title: "Can I create my own course?",
          onPressed: () {},
        ),
        HelpCenterContainerWg(title: "Is Elera free to use?", onPressed: () {}),
        HelpCenterContainerWg(
          title: "How to make offer on Elera?",
          onPressed: () {},
        ),
      ],
    );
  }
}
