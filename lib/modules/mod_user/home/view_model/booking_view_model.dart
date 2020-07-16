
import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookingsViewModel extends BaseViewModel {
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<dynamic>> _events = {
    DateTime.now().add(Duration(days: 1)): [
      Booking(
          slot: TimeOfDay(hour: 9, minute: 30),
          customerName: "Delia Massay",
          serviceName: "Hairdo",
          duration: "2 hours"),
      Booking(
          slot: TimeOfDay(hour: 10, minute: 30),
          customerName: "Valdro",
          serviceName: "Blow dry",
          duration: "1 hour"),
      Booking(
          slot: TimeOfDay(hour: 11, minute: 30),
          customerName: "Nina",
          serviceName: "Make up",
          duration: "2 hours"),
      Booking(
          slot: TimeOfDay(hour: 12, minute: 30),
          customerName: "Delia Massay",
          serviceName: "Hairdo",
          duration: "2 hours"),
      Booking(
          slot: TimeOfDay(hour: 13, minute: 30),
          customerName: "Delia Massay",
          serviceName: "Hairdo",
          duration: "2 hours"),
      Booking(
          slot: TimeOfDay(hour: 14, minute: 30),
          customerName: "Delia Massay",
          serviceName: "Hairdo",
          duration: "2 hours"),
    ]
  };

  List _selectedEvents = [];

  List get selectedEvents => _selectedEvents;

  DateTime get selectedDate => _selectedDate;
  Map<DateTime, List<dynamic>> get events => _events;

  void mapEvents() {
    /// map events here (saved in server to [_events])
  }

  void selectDate(dateTime, List<dynamic> events) {
    _selectedEvents = events;
    _selectedDate = dateTime;
    notifyListeners();
  }
}
