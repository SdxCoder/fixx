



import 'package:client/modules/mod_admin/buisness_setup/views/add_employee.dart';
import 'package:client/modules/mod_admin/buisness_setup/views/add_service_details.dart';
import 'package:client/modules/mod_admin/buisness_setup/views/choose_service.dart';
import 'package:client/modules/mod_admin/home/view/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
       
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AdminHomeView()),
        Router('/chooseService', child: (_, args) => ChooseServiceView()),
        Router('/serviceDetails', child: (_, args) => AddServiceDetailsView()),
         Router('/addEmployee', child: (_, args) => AddEmployeeView()),
      ];

  static Inject get to => Inject<AdminModule>.of();
}