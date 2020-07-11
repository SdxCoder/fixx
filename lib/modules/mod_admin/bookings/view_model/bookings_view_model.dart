import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BookingsViewModel extends BaseViewModel {

  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<dynamic>> _events = {
    DateTime.now().add(Duration(days: 1)) : [
      Booking(
        slot: TimeOfDay(hour: 9, minute: 30),
        customerName: "Delia Massay",
        serviceName: "Hairdo",
        duration: "2 hours"
      ),
       Booking(
        slot: TimeOfDay(hour: 10, minute: 30),
        customerName: "Valdro",
        serviceName: "Blow dry",
        duration: "1 hour"
      ),
       Booking(
        slot: TimeOfDay(hour: 11, minute: 30),
        customerName: "Nina",
        serviceName: "Make up",
        duration: "2 hours"
      ),
       Booking(
        slot: TimeOfDay(hour: 12, minute: 30),
        customerName: "Delia Massay",
        serviceName: "Hairdo",
        duration: "2 hours"
      ),
       Booking(
        slot: TimeOfDay(hour: 13, minute: 30),
        customerName: "Delia Massay",
        serviceName: "Hairdo",
        duration: "2 hours"
      ),
       Booking(
        slot: TimeOfDay(hour: 14, minute: 30),
        customerName: "Delia Massay",
        serviceName: "Hairdo",
        duration: "2 hours"
      ),
    ]
  };
  
 
  List _selectedEvents = [];
  //Slot _selectedSlot;

  List get selectedEvents => _selectedEvents;

  DateTime get selectedDate => _selectedDate;
  Map<DateTime, List<dynamic>> get events => _events;
 // Slot get selectedSlot => _selectedSlot;

  // void updateBooking() {
  //   _booking = Booking(
  //     level: _booking.level,
  //     course: _booking.course,
  //     tutor: _booking.tutor,
  //     user: _booking.user,
  //     topics: _booking.topics,
  //     status: _booking.status,
  //     slot: _selectedSlot,
  //     studentId: _booking.user.uid,
  //     tutorId: _booking.tutor.uid,
  //     // id: _booking.hashCode.toString()
  //   );

  //   Modular.to.pushNamed(Routes.bookingSummary, arguments: _booking);
  // }

  void mapEvents() {
    //   var availbleSlots = _booking.tutor.availableSlots;
    // availbleSlots.forEach((key, value) {
    //   print(value.toString());
    //   var date = DateTime.parse(key);
    //   if (date.compareTo(DateTime.now()) == 1) {
    //     Map<DateTime, List<dynamic>> map = <DateTime, List<dynamic>>{
    //       date: value
    //     };
    //     _events.addAll(map);
    //   }
    // });
    // notifyListeners();
  }

  // void selectSlot(slot) {
  //   //var s = Slot.fromJson(slot);
  //   print(_selectedDate.toString());
  //   _selectedSlot = Slot(
  //       timeSlot: slot.timeSlot,
  //       availablityStatus: slot.availablityStatus,
  //       date: _selectedDate);
  //   notifyListeners();
  // }

  void selectDate(dateTime, List<dynamic> events) {
    _selectedEvents = events;
    _selectedDate = dateTime;
    notifyListeners();
  }

  // void setBooking(Booking booking) {
  //   _booking = booking;
  //   notifyListeners();
  // }
}