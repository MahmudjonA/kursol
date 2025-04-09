import 'package:flutter/material.dart';

import '../../widgets/chats_widget.dart';


class MentorsBody extends StatelessWidget {
  const MentorsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return ChatsWidget(
          imagePath: 'assets/images/boy.png',
          name: 'Mentor',
          jobTitle: 'Specialist in Field',
        );
      },
    );
  }
}
