import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import '../../../core/core.dart';
import 'auth_view.dart';

import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final rPassController = TextEditingController();
  final fNameController = TextEditingController();
  final rNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final foodController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FocusNode emailfocusNode;
  FocusNode passfocusNode;
  FocusNode rPassfocusNode;
  FocusNode fNamefocusNode;
  FocusNode lNamefocusNode;
  FocusNode phoneNofocusNode;
  @override
  void initState() {
    emailfocusNode = FocusNode();
    passfocusNode = FocusNode();
    rPassfocusNode = FocusNode();
    fNamefocusNode = FocusNode();
    lNamefocusNode = FocusNode();
    phoneNofocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    rPassController.dispose();
    emailfocusNode.dispose();
    passfocusNode.dispose();
    rPassfocusNode.dispose();
    fNamefocusNode.dispose();
    lNamefocusNode.dispose();
    phoneNofocusNode.dispose();
    super.dispose();
  }

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, AuthViewModel model, child) => AuthView(
          model: model,
          formCard: _signUpForm(model, media),
        ),
      ),
    );
  }

  Widget _signUpForm(AuthViewModel model, media) {
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
                  "Sign Up",
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
                  hintText: "Username",
                  prefixIconData: Icons.person,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFieldCustom(
                  backgroundColor: Colors.transparent,
                  hintText: "Gender",
                  prefixIconData: Icons.person,
                ),
                SizedBox(
                  height: 16,
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
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Theme.of(context).accentColor,
                        value: _selected,
                        onChanged: (v) {
                           setState(() {
                              _selected = v;
                            });
                          if(v == true){
                           
                            showTermAndConditionsDialogBox();
                          }
                        }),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Accep Data Protectiona and Accept \nTerms and Conditions",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: raisedButton(
                        widget: Text(
                          "Start trial month",
                        ),
                        onPressed: () async {
                          Modular.to.pushNamed(Routes.phoneNumber);
                        }),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Here?   ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Modular.to.pushNamed(Routes.login);
                      },
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: AppTheme.accentColor,
                            fontWeight: FontWeight.bold),
                      ),
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

  Future showTermAndConditionsDialogBox() {
    return showDialog(
        context: Modular.navigatorKey.currentState.overlay.context,
        builder: (context) => Dialog(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                width: 500,
                margin: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "TERMS AND CONDITIONS",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      RoundedCard(
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                           textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.caption,
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
                              value: true,
                              onChanged: (v) {}),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Accep Data Protectiona and Accept \nTerms and Conditions",
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: raisedButton(
                            widget: Text("OK"),
                            onPressed: () {
                              Modular.to.pop();
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ));
  }
}
