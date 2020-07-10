

import 'package:flutter/material.dart';

class Booking{
  final String customerName;
  final String serviceName;
  final String duration;
  final TimeOfDay slot;

  Booking( {this.slot,this.customerName, this.serviceName, this.duration});
}