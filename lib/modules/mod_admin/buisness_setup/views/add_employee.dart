import 'package:client/core/core.dart';
import 'package:client/core/models/employee.dart';
import 'package:client/modules/mod_admin/buisness_setup/view_models/employee_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class AddEmployeeView extends StatefulWidget {
  @override
  _AddEmployeeViewState createState() => _AddEmployeeViewState();
}

class _AddEmployeeViewState extends State<AddEmployeeView> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();


  @override
  void dispose() { 
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
      viewModelBuilder: () => EmployeeViewModel(),
      builder: (context, model, child) => ResponsiveBuilder(
        builder: (context, media) => Scaffold(
            appBar: buildAppBar(
              context: context,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              title: Text("Employee"),
            ),
            body: SingleChildScrollView(
                          child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    model.newlyAddedEmployee == null
                        ? Offstage()
                        : 
                        RoundedCard(
                           circularRadius: 10,
                      cardColor: AppTheme.primaryColorLight,
                          content: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: _employee(context, media,   model.newlyAddedEmployee),
                          )),
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
                              hintText: "Employee Name",
                            ),
                            Divider(
                              color: Theme.of(context).primaryColor,
                            ),
                            TextFieldCustom(
                                 controller: _phoneController,
                              backgroundColor: Colors.transparent,
                              hintText: "Telephone No",
                            ),
                            Divider(
                              color: Theme.of(context).primaryColor,
                            ),
                            TextFieldCustom(
                                 controller: _emailController,
                              backgroundColor: Colors.transparent,
                              hintText: "Email Address",
                            ),
                            SizedBox(height: 16),
                            
                            model.newlyAddedEmployee != null ? Offstage() :  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Visible on service side",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                                CupertinoSwitch(
                                    activeColor: Theme.of(context).accentColor,
                                    value: model.visible,
                                    onChanged: (v) {
                                      model.changeVisibility(v);
                                    })
                              ],
                            ),
                            SizedBox(height: 16),
                            model.newlyAddedEmployee == null ?
                            SizedBox(
                              width: media.screenSize.width,
                              height: 48,
                              child: raisedButton(
                                  widget: Text(
                                    "Add Employee",
                                  ),
                                  onPressed: () async {
                                    model.addEmployee(Employee());
                                  }),
                            ):
                               SizedBox(
                              width: media.screenSize.width,
                              height: 48,
                              child: raisedButton(
                                  widget: Text(
                                    "Add and Send Invite",
                                  ),
                                  onPressed: () async {
                                    model.addEmployee(Employee());
                                  }),
                            ),
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
                          "Add Another Employee",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: AppTheme.primaryColors,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            "Add another employee if you have multiple services",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.grey)),
                        trailing: IconButton(
                            icon: Icon(Icons.add, color: AppTheme.accentColor),
                            onPressed: () {
                              _emailController.clear();
                              _phoneController.clear();
                              _nameController.clear();
                              model.newlyAddedEmployee = null;
                              model.notifyListeners();
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Extra Charge:        \$5",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 16,
                    ),
                      Text("This price is based on the bumber of employees.\n\$5 per employee will be charged.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ),
                      SizedBox(
                      height:20,
                    ),
                    SizedBox(
                        width: media.screenSize.width,
                        height: 48,
                        child: raisedButton(
                            widget: Text(
                              "NEXT",
                            ),
                            onPressed: () async {
                              Modular.to.pushNamed(Routes.serviceAppointment);
                            }),
                      ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  // Widget _addedEmployeeList(
  //     context, EmployeeViewModel model, SizingInformation media) {
  //   return ListView.builder(
  //     shrinkWrap: true,
  //     itemCount: model.employeesList.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       final employee = model.employeesList[index];
  //       return RoundedCard(
  //           circularRadius: 10,
  //           cardColor: AppTheme.primaryColorLight,
  //           content: Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: _employee(context, media, employee)));
  //     },
  //   );
  // }

  Widget _employee(context, media, Employee employee) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Employee Name",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text("Telephone No",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 16,
            ),
            Text("Email Address",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Maggie Hogan", style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 16,
            ),
            Text("645-312-6578", style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 16,
            ),
            Text("demo[at]demo[dot]com",
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    );
  }
}
