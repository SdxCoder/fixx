import 'package:client/core/core.dart';
import 'package:client/modules/mod_user/profile/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, ProfileViewModel model, child) => Scaffold(
        appBar: buildAppBar(
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Profile"),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/profile_image.png"),
                            ),
                            title: Text("Cynthia Pierce",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                            subtitle:Text("dot[at]dotcom",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ),
                            trailing: IconButton(
                                icon: Icon(FontAwesome.edit),
                                color: AppTheme.accentColor,
                                onPressed: (){
  Modular.to.pushNamed(Routes.editAccount);
                                },
                               ),),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                             
                              title: Text("LOCATION",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                              trailing: CupertinoSwitch(
                                  activeColor: AppTheme.accentColor,
                                  value: true,
                                  onChanged: (v) {})),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                             
                              title: Text("NOTIFICATION",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                              trailing: CupertinoSwitch(
                                  activeColor: AppTheme.accentColor,
                                  value: true,
                                  onChanged: (v) {})),
                        ),
                      ),
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                           
                            title: Text("ACCOUNT SETTINGS",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppTheme.borderColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            onTap: () {
                              Modular.to.pushNamed(Routes.userStrikes);
                            },
                            title: Text("STRIKES",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppTheme.borderColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            onTap: () {
                              Modular.to.pushNamed(Routes.myContract);
                            },
                            title: Text("TERMS AND CONDITIONS",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppTheme.borderColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: RoundedCard(
                        circularRadius: 10,
                        cardColor: AppTheme.primaryColorLight,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ListTile(
                            onTap: () {
                             
                            Modular.to.pushNamedAndRemoveUntil('/', (route) => false);
                            },
                            title: Text("LOGOUT",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
