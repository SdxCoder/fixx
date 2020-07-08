import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core.dart';
import '../view_model/auth_view_model.dart';
import 'auth_view.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, AuthViewModel model, child) => AuthView(
          // appBar: null,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            // height: 70,
            child: buildAppBar(
                context: context,
                backgroundColor: Colors.transparent,
                title: Text(
                  'Recover password',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                automaticallyImplyLeading: true),
          ),
          SizedBox(
            height: 100,
          ),
          Text(
              'Enter the email of your \n account and we will send you the recovery link\n',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            width: media.screenSize.width * 0.7,
            child: TextFieldCustom(
              hintText: "Email",
              prefixIconData: Icons.email,
            ),
          ),
          SizedBox(
            height: media.screenSize.height * 0.3,
          ),
          SizedBox(
            width: media.screenSize.width * 0.7,
            height: 48,
            child: raisedButton(
                widget: Text(
                  "Submit",
                ),
                onPressed: () {}),
          ),
        ]),
      ),
    );
  }
}
