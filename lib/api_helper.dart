class ApiHelper {
  final String _apiUri = "https://api.dubaitops.com/";
  final String _mapUri = "https://www.dubaitops.com/";
  final String _token = "?token=AgC44qfHUw4ua5Fo";

  String get apiUri => _apiUri;

  String get mapUri => _mapUri;
  final String mobile = "user/mobile";
  final String verifyOtp = "user/verify";
  final String login = "user/login";
  final String userProfile = "user/profile";
  final String updateUserProfile = "user/update";

  String get token => _token;
}