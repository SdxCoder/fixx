
import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class MyBookingsViewModel extends BaseViewModel {

  List<Booking> bookings = [
    Booking(
      status: BookingsType.upcoming
    ),
    Booking(
      status: BookingsType.past
    ),
   
  ];
}