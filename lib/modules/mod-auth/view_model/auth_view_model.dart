import 'package:flutter_modular/flutter_modular.dart';

import 'package:client/core/core.dart';

import 'package:stacked/stacked.dart';

class AuthViewModel extends BaseViewModel {
  final _authService = Modular.get<AuthService>();
  final validationService = Modular.get<FormValidationService>();
  //final _rbacService = Modular.get<RBACService>();

  String role = Role.user;
  List<String> foodCategories = [];

  void selectRole(String value) {
    role = value;
    print(role);
    notifyListeners();
  }

  void addFoodCatergories(String value) {
    if (value.isNotEmpty) {
      foodCategories.add(value.toUpperCase());
      foodCategories = foodCategories.toSet().toList();
      print(value.isEmpty);
      notifyListeners();
    }
  }

  Future signUpWithEmailAndPassword({
    String email,
    String password,
    String firstName,
    String lastName,
    String phoneNo,
    DateTime dob,
  }) async {
    setBusy(true);
    var result = await _authService.signUpWithEmailPassword(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNo: phoneNo,
        dob: dob);
    setBusy(false);
    if (result is String) {
     // await showDialogBox(title: "Error", description: result);
     Modular.to.pushReplacementNamed(Routes.adminHome);
    } else {
       //_rbacService.getRoleBasedAccess();
     // Modular.to.pushNamed(Routes.home);
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 4));
    var result = await _authService.signInWithEmailPassword(email, password);
    setBusy(false);
    if (result is String) {
     // await showDialogBox(title: "Error", description: result);
       Modular.to.pushReplacementNamed(Routes.userHome);
    } else {
      // Modular.to.pushNamed(Routes.home);
      //_rbacService.getRoleBasedAccess();
    }
  }

  Future signInWithGoogle() async {
    var result = await _authService.signInWithGoogle();

    if (result is String) {
      await showDialogBox(title: "Error", description: result);
    } else {
      //Modular.to.pushNamed(Routes.home);
      //_rbacService.getRoleBasedAccess();
    }
  }

  Future signInWithFacebook() async {
    var result = await _authService.signInWithFaceBook();

    if (result is String) {
      await showDialogBox(title: "Error", description: result);
    } else {
     // Modular.to.pushNamed(Routes.home);
      //_rbacService.getRoleBasedAccess();
    }
  }

  Future sendPasswordResetEmail(String email) async {
    // setBusy(true);
    var result = await _authService.sendPasswordResetEmail(email);
    // setBusy(false);
    if (result is String) {
      await showDialogBox(title: "Error", description: result);
    } else {
      await showDialogBox(
          title: "Success",
          description: "Password reset link sent to \nEmail: $email");
    }
  }

  void removeFoodCategory(String element) {
    foodCategories.remove(element);
    notifyListeners();
  }
}
