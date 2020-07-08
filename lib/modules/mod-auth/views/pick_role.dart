import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../../../core/shared_widgets/button.dart';
import '../../../core/shared_widgets/rounded_card.dart';
import '../../../core/utils/appTheme.dart';
import '../../../core/utils/appTheme.dart';

class RolePickerView extends StatefulWidget {
  @override
  _RolePickerViewState createState() => _RolePickerViewState();
}

class _RolePickerViewState extends State<RolePickerView> {
  String _role = Role.professional;
  bool _chooseRoleScreen = true;

  void _changeRole(String role) {
    setState(() {
      _role = role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child:!_chooseRoleScreen ? _chooseAuth() :
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "You are !",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Tell us about youself to specify\nyour account.",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(height: 32),
            RoundedCardTapable(
              onTap: () {
                _changeRole(Role.professional);
              },
              cardColor: _role == Role.professional
                  ? Theme.of(context).accentColor
                  : AppTheme.primaryColorLight,
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'M A PROFESSIONAL",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            RoundedCardTapable(
              onTap: () {
                _changeRole(Role.user);
              },
              cardColor: _role == Role.user
                  ? Theme.of(context).accentColor
                  : AppTheme.primaryColorLight,
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'M A USER",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs.",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 48,
                child: raisedButton(
                  btnText: 'Continue',
                  onPressed: () {
                    setState(() {
                      _chooseRoleScreen = false;
                    });
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _chooseAuth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
           Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Looking for a booking",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 48,
              child: raisedButton(
                btnText: 'Sign In',
                onPressed: () {
                  Modular.to.pushNamed(Routes.login);
                },
              ),
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 48,

              child: raisedButton(
                btnColor: AppTheme.primaryColorLight,
                btnText: 'Sign Up',
                onPressed: () {
                  Modular.to.pushNamed(Routes.signup);
                },
              ),
            ),


      ],
    );
  }
}
