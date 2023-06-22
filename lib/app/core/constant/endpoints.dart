
import '../../../flavors.dart';

abstract class Endpoints {
  static String apiUrl = '${AppFlavor.apiBaseUrl}/api';

  // Auth
  static String authme = '$apiUrl/auth/me';
  static String login = '$apiUrl/auth/sign-in';
  static String authByApple = '$apiUrl/auth/apple';
  static String authByGoogle = '$apiUrl/auth/google';
  static String authByFacebook = '$apiUrl/auth/facebook';
  static String register = '$apiUrl/auth/sign-up';
  static String refershToken = '$apiUrl/auth/refresh-tokens';
  //
  static String getArticles = '$apiUrl/articles';
  // Location
  static String getState = '$apiUrl/states';
  static String getCities = '$apiUrl/cities';
  static String getCurrentCity = 'http://ip-api.com/json';
  // Profile
  static String updateProfile = '$apiUrl/auth/update-profile';
  //Children
  static String getChildren = '$apiUrl/parents/';
  //Classes
  static String getClassById = '$apiUrl/class';
  static String getClassOfChild = '$apiUrl/class-of-child';
  static String cancelClassOfChild = '$apiUrl/cancel-class-of-child';
  static String getUpcomingClasses = '$apiUrl/class-upcoming-classes';
  static String cancelUpcomingClass = '$apiUrl/cancel-upcoming-class';
  static String getPassesClass = '$apiUrl/class-pass-classes';
  static String usePassClass = '$apiUrl/use-pass-class';
  static String getPreviousClasses = '$apiUrl/previous-classes';
  static String bookAgainClass = '$apiUrl/book-again-class';
  static String getClassNearBy = '$apiUrl/class-near-by';
  
  // Categories
  static String getCategories = '$apiUrl/categories';

  //Comment
  static String getCommentOfClass = '$apiUrl/class/comment';

  //Offer
  static String getSpecialOffers = '$apiUrl/special-offers';

  //Favourite
  static String getFavourites = '$apiUrl/favourite';

  // AWS
  static String generateUploadImageSignedURL = '$apiUrl/organizations/images';
}
