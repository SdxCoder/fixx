import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import '../../../core/core.dart';

import '../../../core/utils/appTheme.dart';
import '../view_model/auth_view_model.dart';
import 'auth_view.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, AuthViewModel model, child) => AuthView(
          model: model,
          formCard: _loginForm(model, media),
        ),
      ),
    );
  }

  Widget _loginForm(AuthViewModel model, media) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text(
                  "Sign In",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFieldCustom(
                  backgroundColor: Colors.transparent,
                  hintText: "Email",
                  prefixIconData: Icons.email,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  backgroundColor: Colors.transparent,
                  hintText: "Password",
                  prefixIconData: Icons.lock,
                ),
                SizedBox(
                  height: 32,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed(Routes.forgotPassword);
                    },
                    child: Text(
                      'Forgot password ?',
                      style: TextStyle(
                          height: 1.170731707317073,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    
                    Checkbox(
                      activeColor: Theme.of(context).accentColor,
                      value: true, onChanged: (v) {}),
                    SizedBox(width: 8,),
                    Text("Remember me !", style: Theme.of(context).textTheme.bodyText1,)
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: raisedButton(
                        widget: Text(
                          "Login",
                        ),
                        onPressed: () async {}),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New Here?  ", style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color:Colors.white
                    ),),
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(Routes.signup);
                      },
                      child: Text(
                        'Register',
                         style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color:AppTheme.accentColor,
                      fontWeight: FontWeight.bold
                    ),),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ]),
        ),
      ),
    );
  }

}
