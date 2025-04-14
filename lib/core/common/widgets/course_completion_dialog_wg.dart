import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class CourseCompletionDialog extends StatefulWidget {
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  const CourseCompletionDialog({
    super.key,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<CourseCompletionDialog> createState() => _CourseCompletionDialogState();
}

class _CourseCompletionDialogState extends State<CourseCompletionDialog> {
  int _selectedStars = 4;
  final TextEditingController _reviewController = TextEditingController(
    text: "The courses & mentors are great! 🔥",
  );

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor:
      isDarkMode ? AppColors.background.dark2 : AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/review.png", width: 120, height: 120),
            const SizedBox(height: 16),
            Text(
              "Course Completed!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Please leave a review",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode
                    ? AppColors.greyScale.grey400
                    : AppColors.greyScale.grey700,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedStars ? Icons.star : Icons.star_border,
                    color: AppColors.background.blueAccent,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStars = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reviewController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.greyScale.grey400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors.primary()),
                ),
                filled: true,
                fillColor: isDarkMode
                    ? AppColors.background.dark3
                    : AppColors.greyScale.grey100,
                hintText: "The courses & mentors are great! 🔥",
                hintStyle: TextStyle(
                  color: isDarkMode
                      ? AppColors.greyScale.grey400
                      : AppColors.greyScale.grey600,
                ),
              ),
              maxLines: 2,
              style: TextStyle(
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: widget.onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
              ),
              child: const Text(
                "Write a review",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: widget.onCancel,
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 16, color: AppColors.primary()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
