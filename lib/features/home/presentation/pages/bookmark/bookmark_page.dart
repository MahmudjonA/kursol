import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;
import 'package:iconly/iconly.dart';
import 'package:lms_system/core/utils/logger.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/common/colors/app_colors.dart';
import '../../../../../core/common/widgets/app_bar/action_app_bar_wg.dart';
import '../../../../../core/common/widgets/custom_choice_chip_wg.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/responsiveness/app_responsive.dart';
import '../../../../../core/text_styles/urbanist_text_style.dart';
import '../../../../auth/data/data_sources/local/auth_local_data_source.dart';
import '../../bloc/category/category_bloc.dart';
import '../../bloc/category/category_state.dart';
import '../../bloc/home_event.dart';
import '../../bloc/wishlist/wishlist_bloc.dart';
import '../../bloc/wishlist/wishlist_state.dart';
import '../../widgets/course_card_widget.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  int selectedIndex = 0;
  final authLocal = sl<AuthLocalDataSource>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadWishlist();
    });
    context.read<CategoryBloc>().add(GetCategoriesEvent(limit: 10));
  }

  Future<void> _loadWishlist() async {
    final tokens = await authLocal.getAuthToken();
    final accessToken = tokens['access_token'];

    context.read<WishlistBloc>().add(
      GetWishlistEvent(limit: 10, token: accessToken!),
    );
    LoggerService.error(accessToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScale.grey50,
      appBar: ActionAppBarWg(
        onBackPressed: () => Navigator.pop(context),
        titleText: "My Bookmark",
        actions: [
          IconButton(
            icon: Icon(IconlyLight.more_circle, size: appH(28)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(14)),
        child: Column(
          children: [
            SizedBox(height: appH(10)),
            // ! Category check bar
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: appW(12)),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: appW(90),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.all(appW(8)),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is CategoryLoaded) {
                  final categories = state.categories;
                  return SizedBox(
                    height: appH(40),
                    child: ListView.builder(
                      itemCount: categories.count,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CustomChoiceChipWg(
                          index: index,
                          label: categories.results[index].name,
                          selectedIndex: selectedIndex,
                          onSelected: (selected) {
                            setState(() {
                              selectedIndex = selected ? index : selectedIndex;
                            });
                          },
                        );
                      },
                    ),
                  );
                } else if (state is CategoryError) {
                  return Center(child: Text('Ошибка: ${state.message}'));
                }
                return const SizedBox.shrink();
              },
            ),
            // ! Category check bar
            Expanded(
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading) {
                    return Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primary.blue500,
                        size: 60.0,
                      ),
                    );
                  } else if (state is WishlistLoaded) {
                    final courses = state.wishlistResponse;
                    return ListView.builder(
                      itemCount: courses.count,
                      itemBuilder: (context, index) {
                        final course = courses.results[index];
                        return CourseCard(
                          onTap: () {},
                          imagePath: course.courseImage ?? 'Null',
                          category: course.categoryName,
                          title: course.courseTitle,
                          price: double.parse(course.price),
                          oldPrice: 80,
                          rating: 4.8,
                          students: 8289,
                          onBookmarkPressed: () {},
                        );
                      },
                    );
                  } else if (state is WishlistError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalBottomSheetMenu(String title, String category) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: appH(402),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: appH(10)),
              Text(
                "Remove from Bookmark?",
                style: UrbanistTextStyles().bold(
                  color: AppColors.greyScale.grey900,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: appH(10)),
              Divider(thickness: 1, color: AppColors.greyScale.grey200),
              CourseCard(
                onTap: () {},
                imagePath: 'assets/images/Rectangle2.png',
                category: 'Entrepreneurship',
                title: 'Digital Entrepreneur...',
                price: 39,
                oldPrice: 80,
                rating: 4.8,
                students: 8289,
                onBookmarkPressed: () {},
              ),
              SizedBox(height: appH(20)),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary.blue100,
                        padding: EdgeInsets.symmetric(horizontal: appW(30)),
                        minimumSize: const Size(0, 58),
                      ),
                      child: Text(
                        "Cancel",
                        style: UrbanistTextStyles().bold(
                          color: AppColors.primary.blue500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: appW(10)),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary.blue500,
                        padding: EdgeInsets.symmetric(horizontal: appW(30)),
                        minimumSize: const Size(0, 58),
                      ),
                      child: Text(
                        "Yes, Remove",
                        style: UrbanistTextStyles().bold(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
