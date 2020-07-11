import 'package:flutter_modular/flutter_modular.dart';
import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {


  Future handleStartUpLogic() async {
  
    await Future.delayed(Duration(seconds: 3));
    if (true) {
     
      Modular.to.pushReplacementNamed(Routes.adminHome);
    } else {
      Modular.to.pushReplacementNamed(Routes.selectRole);
    }
  }

 
}
