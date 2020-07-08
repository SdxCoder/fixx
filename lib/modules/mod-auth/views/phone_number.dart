import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import '../../../core/core.dart';

import '../view_model/auth_view_model.dart';

class PhoneNumberView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => ViewModelBuilder.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, AuthViewModel model, child) => Scaffold(
       
          body: _form(model, media),
        ),
      ),
    );
  }

  Widget _form(AuthViewModel model, SizingInformation media) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Enter your phone\nnumber",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            TextFieldCustom(
              backgroundColor: Colors.transparent,
              hintText: "Enter phone number",
              prefixWidget: CountryCodePicker(
                onChanged: (CountryCode code) {
                  print(code.dialCode);
                },
                textStyle: Theme.of(context).textTheme.bodyText1,
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                showFlag: true,
                alignLeft: false,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: SizedBox(
                width: media.screenSize.width,
                height: 48,
                child: raisedButton(
                    widget: Text(
                      "Next",
                    ),
                    onPressed: () async {
                      Modular.to.pushNamed(Routes.code);
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
