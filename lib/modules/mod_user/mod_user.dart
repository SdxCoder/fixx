import 'package:client/modules/mod_user/home/view/booking_detail.dart';
import 'package:client/modules/mod_user/home/view/category_details.dart';
import 'package:client/modules/mod_user/home/view/choose_category.dart';
import 'package:client/modules/mod_user/home/view/notifications.dart';
import 'package:client/modules/mod_user/home/view/order_confirmed.dart';
import 'package:client/modules/mod_user/home/view/order_summary.dart';
import 'package:client/modules/mod_user/home/view/service_details.dart';
import 'package:client/modules/mod_user/profile/views/strikes_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/view/user_home_view.dart';
import 'profile/views/edit_profile_view.dart';

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
        Router('/editAccount', child: (_, args) => EditProfileView()),
        Router('/userStrikes', child: (_, args) => UserStrikesView()),
        Router('/userNotifications',
            child: (_, args) => UserNotificationsView()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
