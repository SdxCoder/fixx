
import 'package:stacked/stacked.dart';

class BookingsViewModel extends BaseViewModel {
  DateTime _selectedDate = DateTime.now();
  Map<DateTime, List<dynamic>> _events = {
    DateTime.now().add(Duration(days: 1)): [
     "09:30 am - 10:30 pm",
     "09:30 am - 10:31 pm",
     "09:30 am - 10:32 pm",
     "09:30 am - 10:33 pm",
     "09:30 am - 10:34 pm",
     "09:30 am - 10:35 pm",
     "09:30 am - 10:36 pm",
     "09:30 am - 10:37 pm",
     "09:30 am - 10:38 pm",
     "09:30 am - 10:39 pm",
     "09:30 am - 10:40 pm",
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
