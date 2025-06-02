import 'package:flutter/material.dart';

import '../models/AccountModel.dart';
import '../models/PatientModel.dart';

class GlobalData {
  static AccountModel? accountData;
  static PatientModel? patientData;
  static String? insuranceCompany;
  static BuildContext? globalContext;
}
