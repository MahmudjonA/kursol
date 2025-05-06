import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/home/presentation/pages/notification/widgets/message_wv.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../bloc/home_event.dart';
import '../../bloc/notification/notification_bloc.dart';
import '../../bloc/notification/notification_state.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(GetNotificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: "Notification",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14.0)),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NotificationLoaded) {
              final notifications = state.notifications.results;

              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];

                  return MessageWv(
                    isRead: notification.isRead,
                    title: notification.title,
                    subtitle: notification.message,
                    imagePath: 'assets/images/Group.png',
                  );
                },
              );
            } else if (state is NotificationError) {
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

// SizedBox(height: appH(10)),
// Text(
//   'Today',
//   style: UrbanistTextStyles().bold(
//     fontSize: 18,
//     color: AppColors.greyScale.grey900,
//   ),
// ),
// MessageWv(
//   title: 'Payment Successful!',
//   subtitle: 'You have made a course payment',
//   imagePath: 'assets/images/Group.png',
// ),
// MessageWv(
//   title: 'Today’s Special Offers',
//   subtitle: 'Now the 3D design course is available',
//   imagePath: 'assets/images/group1.png',
// ),
// SizedBox(height: appH(20)),
// Text(
//   'Yesterday',
//   style: UrbanistTextStyles().bold(
//     fontSize: 18,
//     color: AppColors.greyScale.grey900,
//   ),
// ),
// MessageWv(
//   title: 'Today’s Special Offers',
//   subtitle: 'You get a special promo today!',
//   imagePath: 'assets/images/group2.png',
// ),
// MessageWv(
//   title: 'Credit Card Connected!',
//   subtitle: 'Credit Card has been linked!',
//   imagePath: 'assets/images/Group.png',
// ),
// SizedBox(height: appH(20)),
// Text(
//   'December 22, 2024',
//   style: UrbanistTextStyles().bold(
//     fontSize: 18,
//     color: AppColors.greyScale.grey900,
//   ),
// ),
// MessageWv(
//   title: 'Account Setup Successful!',
//   subtitle: 'Your account has been created!',
//   imagePath: 'assets/images/group3.png',
// ),
// MessageWv(
//   title: 'Today’s Special Offers',
//   subtitle: 'You get a special promo today!',
//   imagePath: 'assets/images/Group.png',
// ),
