import 'package:client/modules/mod_admin/buisness_setup/views/add_employee.dart';
import 'package:client/modules/mod_admin/buisness_setup/views/choose_service.dart';
import 'package:client/modules/mod_admin/home/view/booking_detail.dart';
import 'package:client/modules/mod_admin/settings/views/add_employes.dart';
import 'package:client/modules/mod_admin/settings/views/appointment.dart';
import 'package:client/modules/mod_admin/settings/views/availablity.dart';
import 'package:client/modules/mod_admin/settings/views/bank_details.dart';
import 'package:client/modules/mod_admin/settings/views/my_buisness.dart';
import 'package:client/modules/mod_admin/settings/views/my_contract.dart';
import 'package:client/modules/mod_admin/settings/views/statistics.dart';
import 'package:client/modules/mod_admin/settings/views/strikes.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'buisness_setup/views/add_service.dart';
import 'buisness_setup/views/add_service_apponitment.dart';
import 'home/view/admin_home_view.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AdminHomeView()),
        Router('/chooseService', child: (_, args) => ChooseServiceView()),
        Router('/serviceDetails', child: (_, args) => AddServiceView()),
        Router('/addEmployee', child: (_, args) => AddEmployeeView()),
        Router('/serviceAppointment',
            child: (_, args) => ServiceAppointmentView()),
        Router('/bookingDetails', child: (_, args) => BookingDetailView()),
        Router('/myBuisness', child: (_, args) => MyBuisnessView()),
        Router('/strikes', child: (_, args) => StrikesView()),
        Router('/addSettingsEmployees',
            child: (_, args) => SettingsAddEmployeeView()),
        Router('/myContract', child: (_, args) => MyContractView()),
        Router('/bankDetails', child: (_, args) => BankDetailsView()),
        Router('/stats', child: (_, args) => StatsView()),
        Router('/availability', child: (_, args) => AvailabilityView()),
        Router('/appointment', child: (_, args) => AppointmentView()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}
