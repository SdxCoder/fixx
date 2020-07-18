import 'package:client/core/models/buisness_hours.dart';
import 'package:client/core/utils/appTheme.dart';
import 'package:flutter/material.dart';

const imageUrl =
    'https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg';

class Role {
  static String professional = "Professional";
  static String user = "User";
}

class DatePickerType {
  static String date = "By Date";
  static String range = "By Range";
  static String week = "By Week";
}

class NotificationType {
  static String pending = "pending";
  static String approved = "request";
  static String completed = "completed";
}


class BookingsType {
  static String upcoming = "upcoming";
  static String past = "past";
}

List<BuisnessHours> businessHoursList = [
  BuisnessHours(
    day: "Monday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Tuesday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Wednesday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Thursday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Friday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Saturday",
    from: "-- : --",
    to: "-- : --",
  ),
  BuisnessHours(
    day: "Sunday",
    from: "-- : --",
    to: "-- : --",
  ),
];

List<String> services = [
  "Salon",
  "Dentist",
  "Yoga",
  "Shef",
  "Plumber",
  "Cleaner",
  "Baby Sitter",
  "Driver",
];

List<Color> colors = [
  Colors.purple[200],
  AppTheme.accentColor,
  Colors.pink[200],
  Colors.cyan[300],
  Colors.blue[300],
  Colors.indigo[300],
  Colors.orange[200],
  Colors.lightGreen[200],
];
