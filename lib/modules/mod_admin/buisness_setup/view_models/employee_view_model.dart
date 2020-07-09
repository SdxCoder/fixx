

import 'package:client/core/models/employee.dart';
import 'package:stacked/stacked.dart';

class EmployeeViewModel extends BaseViewModel{

  List<Employee> employeesList = [];

  bool visible = false;

  Employee newlyAddedEmployee;

  void changeVisibility(bool v) {
    visible = v;
    notifyListeners();
  }

  void addEmployee(Employee employee) {
    newlyAddedEmployee = employee;
    employeesList.add(employee);
    notifyListeners();
  }

}