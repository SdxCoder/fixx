
import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class NotificationsViewModel extends BaseViewModel {

  List<Notifications> notifications = [
    Notifications(
      type: NotificationType.pending
    ),
    Notifications(
      type: NotificationType.approved
    ),
    Notifications(
      type: NotificationType.completed
    ),
     Notifications(
      type: NotificationType.pending
    ),
  ];
}