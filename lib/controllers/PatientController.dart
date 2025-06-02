import 'package:denta_soft/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/PatientModel.dart';
import '../services/PatioentServices.dart';

class PatientController extends ChangeNotifier {
  List<Map<String, dynamic>> filterMaritalStatusTabs = [
    {"id": 1, "title": 'Single', "maritalStatus": 'MS1'},
    {"id": 2, "title": 'Married', "maritalStatus": 'MS2'},
    {"id": 3, "title": 'Divorced', "maritalStatus": 'MS3'},
    {"id": 4, "title": 'Widow', "maritalStatus": 'MS4'},
  ];

  List<Map<String, dynamic>> filterPatientTypeTabs = [
    {"id": 1, "title": 'Standard', "patientType": 'PT1'},
    {"id": 2, "title": 'VIP', "patientType": 'PT2'},
    {"id": 3, "title": 'Blacklist', "patientType": 'PT3'},
  ];

  List<Map<String, dynamic>> filterGenderTypeTabs = [
    {"id": 1, "title": 'Male', "Gender": 'Male'},
    {"id": 2, "title": 'Female', "Gender": 'Female'},
  ];

  Map<String, dynamic>? maritalStatusValue;
  Map<String, dynamic>? patientType;
  Map<String, dynamic>? gender;

  bool isLoading = false;

  // Helper method to show loading progress
  void _showLoading() {
    isLoading = true;
    EasyLoading.showProgress(0.3, status: S().loading);
    notifyListeners();
  }

  // Helper method to dismiss loading progress
  void _hideLoading() {
    isLoading = false;
    EasyLoading.dismiss();
    notifyListeners();
  }

  // Update marital status
  void updateMaritalStatus(Map<String, dynamic> state) {
    maritalStatusValue = state;
    notifyListeners();
  }

  // Update patient type
  void updatePatientType(Map<String, dynamic> state) {
    patientType = state;
    notifyListeners();
  }

  // Update gender
  void updateGender(Map<String, dynamic> state) {
    gender = state;
    notifyListeners();
  }

  // Edit profile
  Future<bool> editProfile(BuildContext context, String body) async {
    _showLoading();

    bool status = false;
    try {
      status = await PatientServices().editProfile(body: body);
      _hideLoading();

      return status;
    } catch (e) {
      _hideLoading();
      return false;
    }
  }

  // Save disease profile
  Future<bool> saveDiseaseProfile(BuildContext context, String body) async {
    _showLoading();

    bool status = false;
    try {
      status = await PatientServices().saveDiseasesProfile(body: body);
      _hideLoading();

      return status;
    } catch (e) {
      _hideLoading();
      return false;
    }
  }

  // Save product disease profile
  Future<bool> saveProductDiseaseProfile(
    BuildContext context,
    String body,
  ) async {
    _showLoading();

    bool status = false;
    try {
      status = await PatientServices().saveProductDiseasesProfile(body: body);
      _hideLoading();

      return status;
    } catch (e) {
      _hideLoading();
      return false;
    }
  }

  // Save attachments profile
  Future<bool> saveAttachmentsProfile(
    BuildContext context,
    FormData body,
  ) async {
    _showLoading();

    bool status = false;
    try {
      status = await PatientServices().saveAttachmentsProfile(body: body);
      _hideLoading();

      return status;
    } catch (e) {
      _hideLoading();
      return false;
    }
  }

  // Get patient details
  Future<PatientModel> getPatientDetails({String? patientId}) async {
    PatientModel patientDetails = PatientModel();

    try {
      if (patientId == null) return patientDetails;

      patientDetails = await PatientServices().getPatientDetails(patientId);
      print('test ${patientDetails.patientProcedureViewModels!.length}');

      updateMaritalStatus(
        filterMaritalStatusTabs.firstWhere(
          (element) => element['maritalStatus'] == patientDetails.maritalStatus,
          orElse: () => filterMaritalStatusTabs.first,
        ),
      );

      updatePatientType(
        filterPatientTypeTabs.firstWhere(
          (element) => element['patientType'] == patientDetails.patientType,
          orElse: () => filterPatientTypeTabs.first,
        ),
      );

      updateGender(
        filterGenderTypeTabs.firstWhere(
          (element) => element['Gender'] == patientDetails.gender,
          orElse: () => filterGenderTypeTabs.first,
        ),
      );

      return patientDetails;
    } catch (e) {
      return patientDetails;
    }
  }

  // Get patient calendar
  Future<List<CalendarViewModel>> getPatientCalendars({
    String? patientId,
  }) async {
    List<CalendarViewModel> patientCalendars = [];

    try {
      if (patientId == null) return patientCalendars;

      patientCalendars = await PatientServices().getPatientCalendars(
        patientId: patientId,
      );
      return patientCalendars;
    } catch (e) {
      return patientCalendars;
    }
  }

  // Get patient procedure
  Future<List<PatientProcedureViewModel>> getPatientProcedure({
    String? patientId,
  }) async {
    List<PatientProcedureViewModel> patientProcedureView = [];

    try {
      if (patientId == null) return patientProcedureView;

      patientProcedureView = await PatientServices().getPatientProcedure(
        patientId: patientId,
      );
      return patientProcedureView;
    } catch (e) {
      return patientProcedureView;
    }
  }

  // Get patient diseases
  Future<List<Diease>> getPatientDiseases({String? patientId}) async {
    List<Diease> patientDiseases = [];

    try {
      if (patientId == null) return patientDiseases;

      patientDiseases = await PatientServices().getPatientDiseases(
        patientId: patientId,
      );
      return patientDiseases;
    } catch (e) {
      return patientDiseases;
    }
  }

  // Get patient products
  Future<List<ProductViewModel>> getPatientProducts({String? patientId}) async {
    List<ProductViewModel> patientProducts = [];

    try {
      if (patientId == null) return patientProducts;

      patientProducts = await PatientServices().getPatientProducts(
        patientId: patientId,
      );
      return patientProducts;
    } catch (e) {
      return patientProducts;
    }
  }

  // Delete disease
  Future<bool> deleteDisease({List<String>? ids}) async {
    try {
      if (ids == null || ids.isEmpty) return false;

      bool status = await PatientServices().deleteDisease(ids: ids);
      return status;
    } catch (e) {
      return false;
    }
  }

  // Delete patient product
  Future<bool> deletePatientProduct({List<int>? ids}) async {
    try {
      if (ids == null || ids.isEmpty) return false;

      bool status = await PatientServices().deletePatientProduct(ids: ids);
      return status;
    } catch (e) {
      return false;
    }
  }

  // Add new patient
  Future<bool> addPatient(Map<String, dynamic> body) async {
    try {
      return await PatientServices().addNewPatient(body: body);
    } catch (e) {
      return false;
    }
  }
}
