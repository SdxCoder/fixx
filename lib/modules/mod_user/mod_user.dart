import 'package:client/modules/mod_user/home/view/category_details.dart';
import 'package:client/modules/mod_user/home/view/choose_category.dart';
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
      ];

  static Inject get to => Inject<UserModule>.of();
}
