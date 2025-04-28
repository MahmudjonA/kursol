import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/home/presentation/bloc/mentors/mentors_bloc.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../bloc/home_event.dart';
import '../../bloc/mentors/mentors_state.dart';
import '../../widgets/chats_widget.dart';

class MentorsPage extends StatefulWidget {
  const MentorsPage({super.key});

  @override
  State<MentorsPage> createState() => _MentorsPageState();
}

class _MentorsPageState extends State<MentorsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MentorBloc>().add(GetMentors(limit: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          AppRoute.close();
        },
        titleText: "Top Mentors",
        actions: [
          IconButton(icon: const Icon(IconlyLight.search), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
        child: BlocBuilder<MentorBloc, MentorState>(
          builder: (context, state) {
            if (state is MentorLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MentorLoaded) {
              final mentors = state.mentors.results;
              return ListView.builder(
                itemCount: mentors.length,
                itemBuilder: (BuildContext context, int index) {
                  final mentor = mentors[index];
                  return ChatsWidget(
                    imagePath:
                        mentor.avatarUrl ?? 'Null',
                    name: mentor.fullName,
                    jobTitle: mentor.expertiseDisplay,
                  );
                },
              );
            } else if (state is MentorError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
