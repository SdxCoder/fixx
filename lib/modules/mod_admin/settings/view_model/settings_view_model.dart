import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  List<Notifications> notifications = [
    Notifications(type: NotificationType.pending),
    Notifications(type: NotificationType.approved),
    Notifications(type: NotificationType.completed),
    Notifications(type: NotificationType.pending),
  ];

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

   void selectDate(dateTime, List<dynamic> events) {
    _selectedDate = dateTime;
    notifyListeners();
  }

}
