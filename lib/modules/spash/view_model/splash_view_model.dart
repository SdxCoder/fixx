import 'package:flutter_modular/flutter_modular.dart';
import 'package:client/core/core.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {


  Future handleStartUpLogic() async {
  
    await Future.delayed(Duration(seconds: 3));
    if (true) {
      // navigate based on role to user home or admin home
      Modular.to.pushReplacementNamed(Routes.intro);
    } else {
      Modular.to.pushReplacementNamed(Routes.intro);
    }
  }

 
}
