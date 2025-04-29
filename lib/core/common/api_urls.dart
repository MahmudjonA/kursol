abstract class ApiUrls {
  static const String baseUrl = 'https://manuchehra.pythonanywhere.com/api/';

  //! Auth
  static const String auth = 'auth/';
  static const String register = '${auth}register/';
  static const String login = '${auth}login/';
  static const String confirmEmail = '${auth}confirm-email/';
  static const String resetPassword = '${auth}reset-password/';
  static const String resetPasswordConfirm =
      '${auth}reset-password/confirm-code/';
  static const String resetNewPassword =
      '${auth}reset-password/confirm-password/';
  static const String logout = '${auth}logout/';

  //! Courses
  static const String courses = 'courses/';
  static const String popularCourses = 'courses/popular/?limit=';

  //! Category
  static const String categories = 'categories/?limit=';

  //! Mentors
  static const String mentors = 'mentors/?limit=';
  static const String topMentors = 'mentors/top/?limit=';

  //! Search
  static const String search = 'search/search/?q=';

  //! Wishlist
  static const String wishlist = 'wishlist/?limit=';
}
