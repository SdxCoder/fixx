



import 'package:client/modules/mod_admin/buisness_setup/views/add_employee.dart';
import 'package:client/modules/mod_admin/buisness_setup/views/choose_service.dart';
import 'package:client/modules/mod_admin/home/view/booking_detail.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'buisness_setup/views/add_service.dart';
import 'buisness_setup/views/add_service_apponitment.dart';
import 'home/view/admin_home_view.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
       
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AdminHomeView()),
        Router('/chooseService', child: (_, args) => ChooseServiceView()),
        Router('/serviceDetails', child: (_, args) => AddServiceView()),
         Router('/addEmployee', child: (_, args) => AddEmployeeView()),
          Router('/serviceAppointment', child: (_, args) => ServiceAppointmentView()),
            Router('/bookingDetails', child: (_, args) => BookingDetailView()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}