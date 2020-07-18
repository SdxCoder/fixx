import 'package:client/modules/mod_user/home/view/booking_detail.dart';
import 'package:client/modules/mod_user/home/view/category_details.dart';
import 'package:client/modules/mod_user/home/view/choose_category.dart';
import 'package:client/modules/mod_user/home/view/order_confirmed.dart';
import 'package:client/modules/mod_user/home/view/order_summary.dart';
import 'package:client/modules/mod_user/home/view/service_details.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/view/user_home_view.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UserHomeView()),
        Router('/chooseCategory', child: (_, args) => ChooseCategoryView()),
        Router('/categoryDetails', child: (_, args) => CategoryDetailsView()),
        Router('/categoryServices', child: (_, args) => CategoryServicesView()),
        Router('/bookAppointment', child: (_, args) => BookAppointmentView()),
        Router('/orderSummary', child: (_, args) => OrderSummaryView()),
         Router('/orderConfrimed', child: (_, args) => OrderConfirmedView()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
