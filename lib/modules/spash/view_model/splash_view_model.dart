import 'package:flutter_modular/flutter_modular.dart';
import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  final _authService = Modular.get<AuthService>();

  Future handleStartUpLogic() async {
    // setBusy(true);
    // final bool loggedIn = await _authService.checkUserLoginStatus();
    // setBusy(false);
    await Future.delayed(Duration(seconds: 3));
    if (true) {
      //  Modular.to.pushReplacementNamed(Routes.adminHome);
      Modular.to.pushReplacementNamed(Routes.serviceDetails);
    } else {
      Modular.to.pushReplacementNamed(Routes.selectRole);
    }
  }

 
}
