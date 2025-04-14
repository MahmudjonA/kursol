import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lms_system/features/course_details/presentation/widgets/review_screen_wg.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/route/rout_names.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../../../home/presentation/widgets/chats_widget.dart';
import '../../../../home/presentation/widgets/course_card_widget.dart';

class MentorProfilePage extends StatefulWidget {
  const MentorProfilePage({super.key});

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.black : AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            IconlyLight.arrow_left,
            color: isDarkMode ? AppColors.white : AppColors.black,
            size: 28,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconlyLight.more_circle,
              color: isDarkMode ? AppColors.white : AppColors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Header
          Container(
            padding: EdgeInsets.all(16.0),
            color: isDarkMode ? AppColors.black : AppColors.white,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/mentor_avatar.png',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Jonathan Williams',
                  style: UrbanistTextStyles().bold(
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Senior UI/UX Designer at Google',
                  style: UrbanistTextStyles().bold(
                    color:
                        isDarkMode
                            ? AppColors.greyScale.grey600
                            : AppColors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat('25', 'Courses'),
                    _buildStat('22,379', 'Students'),
                    _buildStat('9,287', 'Reviews'),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.message, color: AppColors.white),
                      label: Text(
                        'Message',
                        style: TextStyle(color: AppColors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.language, color: Colors.blue),
                      label: Text(
                        'Website',
                        style: TextStyle(color: Colors.blue),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // TabBar
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Courses'),
              Tab(text: 'Students'),
              Tab(text: 'Reviews'),
            ],
          ),
          // TabBarView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: appW(16)),
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        onTap: () {
                          // context.pushNamed(RouteNames.courseDetails)
                          Navigator.pushNamed(
                            context,
                            RouteNames.courseDetails,
                          );
                        },
                        imagePath: 'assets/images/Rectangle2.png',
                        category: 'Entrepreneurship',
                        title: 'Digital Entrepren eur...',
                        price: 39,
                        oldPrice: 80,
                        rating: 4.8,
                        students: 8289,
                        onBookmarkPressed: () {},
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return ChatsWidget(
                        imagePath: 'assets/images/boy.png',
                        name: 'Mentor',
                        jobTitle: 'Specialist in Field',
                      );
                    },
                  ),
                  ReviewsScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label),
      ],
    );
  }
}
