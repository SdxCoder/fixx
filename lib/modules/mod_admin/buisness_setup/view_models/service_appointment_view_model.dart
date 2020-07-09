



import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class ServiceAppointmentViewModel extends BaseViewModel{

  List<Service> serviceList = [];

  bool request = false;

 

  void requestAppointment(bool v) {
    request = v;
    notifyListeners();
  }

  void addService(Service service) {

    serviceList.add(service);
    notifyListeners();
  }

  void removeService(Service service) {
     serviceList.remove(service);
    notifyListeners();
  }

}