import 'package:client/core/core.dart';
import 'package:client/modules/mod_admin/buisness_setup/view_models/service_appointment_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class ServiceAppointmentView extends StatefulWidget {
  @override
  _ServiceAppointmentViewState createState() => _ServiceAppointmentViewState();
}

class _ServiceAppointmentViewState extends State<ServiceAppointmentView> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceAppointmentViewModel>.reactive(
      viewModelBuilder: () => ServiceAppointmentViewModel(),
      builder: (context, model, child) => ResponsiveBuilder(
        builder: (context, media) => Scaffold(
            appBar: buildAppBar(
              context: context,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              title: Text("Appointment"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                                          child: Text(
                        "Service Details",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    model.serviceList.isEmpty
                        ? Offstage()
                        : _addedServiceList(context, model, media),
                    SizedBox(
                      height: 16,
                    ),
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                      content: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFieldCustom(
                              controller: _nameController,
                              backgroundColor: Colors.transparent,
                              hintText: "Service Name",
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              controller: _priceController,
                              backgroundColor: Colors.transparent,
                              hintText: "\$ 0",
                            ),
                            SizedBox(height: 8),
                            TextFieldCustom(
                              controller: _durationController,
                              backgroundColor: Colors.transparent,
                              hintText: "Duration (min)",
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Appointment with request",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                                CupertinoSwitch(
                                    activeColor: Theme.of(context).accentColor,
                                    value: model.request,
                                    onChanged: (v) {
                                      model.requestAppointment(v);
                                    })
                              ],
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: media.screenSize.width,
                              height: 48,
                              child: raisedButton(
                                  widget: Text(
                                    "Add Service",
                                  ),
                                  onPressed: () async {
                                    model.addService(Service());
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RoundedCard(
                      circularRadius: 10,
                      cardColor: Colors.white,
                      content: ListTile(
                        title: Text(
                          "Add Another Service",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppTheme.primaryColors,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Add another service if you have multiple services",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.grey)),
                        trailing: IconButton(
                            icon: Icon(Icons.add, color: AppTheme.accentColor),
                            onPressed: () {
                              _durationController.clear();
                              _priceController.clear();
                              _nameController.clear();
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: media.screenSize.width,
                      height: 48,
                      child: raisedButton(
                          widget: Text(
                            "DONE",
                          ),
                          onPressed: () async {
                            Modular.to.pushNamed(Routes.adminHome);
                          }),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _addedServiceList(
      context, ServiceAppointmentViewModel model, SizingInformation media) {
    return Column(children: [
      // ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: model.serviceList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     final service = model.serviceList[index];
      //     return

      ...model.serviceList.map<Widget>((service) => 
      Dismissible(
        key: UniqueKey(),
        onDismissed: (d){
          model.removeService(service);
        },
              child: RoundedCard(
            circularRadius: 10,
            cardColor: AppTheme.primaryColorLight,
            content: ListTile(
                title: Text("Blow Dry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.bold)),
                subtitle: Text("\$15"),
                trailing: Text("10min"))),
      ))
      //   },
      //   ),
    ]);
  }
}
