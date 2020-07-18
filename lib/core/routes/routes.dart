class Routes {
  static const String selectRole = "/selectRole";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String forgotPassword = "/forgotPassword";
  static const String phoneNumber = "/phoneNumber";
  static const String code = "/code";

  static const String adminHome = "/adminHome";
  static const String chooseService = "$adminHome/chooseService";
  static String serviceDetails = "$adminHome/serviceDetails";
  static String addEmployee = "$adminHome/addEmployee";
  static String serviceAppointment = "$adminHome/serviceAppointment";
  static String bookingDetails = "$adminHome/bookingDetails";
  static String myBuisness = "$adminHome/myBuisness";
  static String strikes = "$adminHome/strikes";
  static String myContract = "$adminHome/myContract";
  static String appointment = "$adminHome/appointment";
  static String stats = "$adminHome/stats";
  static String addSettingsEmployees = "$adminHome/addSettingsEmployees";
  static String bankDetails = "$adminHome/bankDetails";
  static String availability = "$adminHome/availability";

  // user home routes
  static const String userHome = "/userHome";
  static const String chooseCategory = "$userHome/chooseCategory";
  static const String categoryDetails = "$userHome/categoryDetails";
  static const String categoryServices = "$userHome/categoryServices";
  static const String bookAppointment = "$userHome/bookAppointment";
  static const String orderSummary = "$userHome/orderSummary";
  static const String orderConfrimed = "$userHome/orderConfrimed";
}
