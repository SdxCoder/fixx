import 'package:client/modules/mod-auth/views/forgot_password.dart';
import 'package:client/modules/mod-auth/views/pick_role.dart';
import 'package:client/modules/mod-auth/views/verification_code.dart';
import 'package:client/modules/mod_admin/mod_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:client/modules/mod-auth/views/login_view.dart';
import 'package:client/modules/spash/view/splash_screen.dart';

import 'core/core.dart';
import 'core/shared_service/form_validation_service.dart';
import 'main.dart';
import 'modules/mod-auth/views/phone_number.dart';
import 'modules/mod-auth/views/sign_up_view.dart';
import 'modules/mod_admin/home/view/admin_home_view.dart';



class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        // Bind services for DI
        Bind((i) => FormValidationService()),
        Bind((i) => AuthService()),
        Bind((i) => UserService()),
        Bind((i) => RBACService()),
      ];

  @override
  Widget get bootstrap => App();

  @override
  List<Router> get routers => [
        Router("/", child: (_, args) => SplashScreen()),
        Router("/login", child: (_, args) => LoginView()),
        Router("/signup", child: (_, args) => SignUpView()),
        Router("/selectRole", child: (_, args) => RolePickerView()),
        Router("/adminHome", child: (_, args) => AdminHomeView()),
        Router("/phoneNumber", child: (_, args) => PhoneNumberView()),
        Router("/code", child: (_, args) => VerificationCodeView()),
        Router('/forgotPassword', child: (_, args) => ForgotPasswordView()),
        Router('/adminHome', module: AdminModule()),
      ];
}
