
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/core.dart';

class VerificationCodeView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, media) => Scaffold(
        appBar: buildAppBar(
          context: context,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          title: Text(""),
        ),
        body: _form(context, media),
      ),
    );
  }

  Widget _form(context, SizingInformation media) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 70,
          ),
          RichText(
            text: TextSpan(
              text: 'Enter the 4-digit\ncode sent at to you at  ',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                // TextSpan(
                //     text: 'bold',
                //     style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text: ' 0767217315',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: VerificationCode(
              textStyle: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: AppTheme.borderColor),
              keyboardType: TextInputType.number,
              length: 4,
              itemSize: 70,
              itemDecoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppTheme.borderColor))),
              // clearAll is NOT required, you can delete it
              // takes any widget, so you can implement your design
              clearAll: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'CLEAR',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              onCompleted: (String value) {
                Modular.to.pushNamed(Routes.chooseService);
              },
              onEditing: (bool value) {
               
              },
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
                  btnColor: AppTheme.primaryColorLight,
                  widget: Text(
                    "I HAVEN'T RECIEVED A CODE",
                  ),
                  onPressed: () async {
                    _settingModalBottomSheet(context);
                  }),
            ),
          ),
        ]),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 320,
            color: AppTheme.primaryColorLight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Enter the 4-digit\ncode sent at to you at  ',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        // TextSpan(
                        //     text: 'bold',
                        //     style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: ' 0767217315!',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: raisedButton(
                        widget: Text(
                          "Yes, resend code by sms",
                        ),
                        onPressed: () async {
                          _settingModalBottomSheet(context);
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: raisedButton(
                        btnColor: Colors.white,
                        widget: Text(
                          "No, i want to change it",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: AppTheme.primaryColors),
                        ),
                        onPressed: () async {
                          _settingModalBottomSheet(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
