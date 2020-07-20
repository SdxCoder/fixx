import 'package:client/core/core.dart';
import 'package:client/modules/mod_admin/settings/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, SettingsViewModel model, child) => Scaffold(
        appBar: buildAppBar(
          context: context,
          backgroundColor: Colors.transparent,
          title: Text("Settings"),
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
                          onTap: () {
                            Modular.to.pushNamed(Routes.strikes);
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.appointment);
                          },
                          title: Text("APPOINTMENT",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.addSettingsEmployees);
                          },
                          title: Text("ADD EMPLOYEES",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.myBuisness);
                          },
                          title: Text("MY BUISNESS",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.myContract);
                          },
                          title: Text("MY CONTRACT",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.stats);
                          },
                          title: Text("STATISTICS",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.bankDetails);
                          },
                          title: Text("BANK DETAILS",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.availability);
                          },
                          title: Text("AVAILABILITY",
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
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          onTap: () {
                            Modular.to.pushNamed(Routes.addEmployee);
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
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
