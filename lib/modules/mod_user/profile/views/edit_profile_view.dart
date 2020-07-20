import 'package:client/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EditProfileView extends StatelessWidget {
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, media) => Scaffold(
              appBar: buildAppBar(
                context: context,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                title: Text("Edit Account"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Stack(
                          children: [
                            Image.asset(
                              "assets/profile_image.png",
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: IconButton(
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: () {
                                      // Open Camera
                                    }))
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Update Picture",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFieldCustom(
                              backgroundColor: Colors.transparent,
                              hintText: "Name",
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              backgroundColor: Colors.transparent,
                              hintText: "Email",
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              obscureText: true,
                              backgroundColor: Colors.transparent,
                              hintText: "Password",
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              backgroundColor: Colors.transparent,
                              hintText: "Mobile Number",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: media.screenSize.width,
                      height: 48,
                      child: raisedButton(
                          widget: Text(
                            "SAVE",
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                        onTap: () async {
                          await cofirmDeactivationDialog();
                        },
                        child: Text(
                          "DEACTIVATE ACCOUNT",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              .copyWith(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ));
  }

  Future cofirmDeactivationDialog() {
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
                      Text(
                        "DEACTIVATE MY ACCOUNT",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Are you sure, you want to deactivate your account?",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: raisedButton(
                                widget: Text("Yes"),
                                onPressed: () {
                                  Modular.to.pop();
                                }),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: raisedButton(
                                btnColor: Colors.white,
                                btnTextColor: Theme.of(context).primaryColor,
                                widget: Text("No"),
                                onPressed: () {
                                  Modular.to.pop();
                                }),
                          ),
                        ],
                      ),
                    ]),
              ),
            ));
  }
}
