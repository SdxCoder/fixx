

import 'package:flutter_modular/flutter_modular.dart';
import 'package:client/core/core.dart';

class RBACService{
  final authService = Modular.get<AuthService>();
  
   void getRoleBasedAccess() {
    User user = authService.currentUser.user;

    if (user.role == Role.professional) {
       print("admin logged in");
      Modular.to.pushReplacementNamed(Routes.adminHome);
    } else {
      print("user logged in");
     // Modular.to.pushReplacementNamed(Routes.userHome);
    }
  }
}