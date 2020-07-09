import 'package:flutter_modular/flutter_modular.dart';
import 'package:stacked/stacked.dart';

class BookingsViewModel extends BaseViewModel {

  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<dynamic>> _events = Map<DateTime, List<dynamic>>();
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