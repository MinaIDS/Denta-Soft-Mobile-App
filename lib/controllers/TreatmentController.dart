import 'package:denta_soft/models/GetProceduresModel.dart';
import 'package:denta_soft/services/ProcedureServices.dart';
import 'package:denta_soft/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

import '../models/InsuranceModel.dart';
import '../models/TreatmentModel.dart';
import '../services/InsuranceCompanyServices.dart';
import '../services/TreatmentServices.dart';

class TreatmentController extends ChangeNotifier {
  List<TreatmentModel> treatments = [];
  List<Widget> listWidget = [];
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController p3Controller = TextEditingController();
  bool isFirstOpen = true;
  bool isLoading = false;

  // Get active treatments
  Future<List<TreatmentModel>> getTreatmentActiveList() async {
    try {
      final activeTreatments = await TreatmentServices().getTreatmentList();
      treatments =
          activeTreatments.where((element) => element.active!).toList();
      return treatments;
    } catch (e) {
      return [];
    }
  }

  // Get inactive treatments
  Future<List<TreatmentModel>> getTreatmentInactiveList() async {
    try {
      final inactiveTreatments = await TreatmentServices().getTreatmentList();
      treatments =
          inactiveTreatments.where((element) => !element.active!).toList();
      return treatments;
    } catch (e) {
      return [];
    }
  }

  List<GetProceduresModel> getProceduresModel = [];

  // Get procedures list by treatment branch
  Future<List<GetProceduresModel>> getProceduresList({
    required String treatmentbranchId,
  }) async {
    try {
      getProceduresModel = await TreatmentServices().getProcedures(
        treatmentbranchId,
      );
      notifyListeners();
      return getProceduresModel;
    } catch (e) {
      return [];
    }
  }

  List<InsuranceModel> getInsuranceCompaniesModel = [];

  // Get insurance companies list
  Future<List<InsuranceModel>> getInsuranceCompaniesList() async {
    try {
      getInsuranceCompaniesModel =
          await InsuranceCompanyServices().getInsuranceCompanies();
      notifyListeners();
      return getInsuranceCompaniesModel;
    } catch (e) {
      return [];
    }
  }

  // Delete procedure
  Future<bool> deleteProcedure({required GetProceduresModel model}) async {
    isLoading = true;
    notifyListeners();

    try {
      bool status = await ProcedureServices().deleteProcedure(
        ProcedureId: model.procedureId!,
      );
      if (status) {
        getProceduresModel.removeWhere(
          (element) => element.procedureId == model.procedureId,
        );
      }
      isLoading = false;
      notifyListeners();
      return status;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  GetProceduresModel getSingleProcedureModel = GetProceduresModel();

  // Get single procedure details
  Future<GetProceduresModel> getSingleProcedure({
    required String singleProcedureId,
  }) async {
    try {
      await getInsuranceCompaniesList();
      getSingleProcedureModel = await ProcedureServices().getSingleProcedure(
        singleProcedureId,
      );

      if (isFirstOpen) {
        for (
          int x = 0;
          x < getSingleProcedureModel.listPriceProcedureViewModelLst!.length;
          x++
        ) {
          final procedure =
              getSingleProcedureModel.listPriceProcedureViewModelLst![x];
          final companyId = procedure.medicalInsuranceId;
          final companyName =
              getInsuranceCompaniesModel
                  .firstWhere(
                    (element) => element.medicalInsuranceId == companyId,
                  )
                  .medicalCompany;

          // Update controllers and list widgets
          if (x == 0) {
            p1Controller.text = procedure.price.toString();
          } else if (x == 1) {
            p2Controller.text = procedure.price.toString();
          } else if (x == 2) {
            p3Controller.text = procedure.price.toString();
          }

          listWidget.add(
            TextFieldWidget(
              labelText: companyName!,
              textInputType: TextInputType.number,
              controller:
                  x == 0
                      ? p1Controller
                      : x == 1
                      ? p2Controller
                      : p3Controller,
            ),
          );
        }
      }

      notifyListeners();
    } catch (e) {
      return getSingleProcedureModel;
    }

    isFirstOpen = false;
    return getSingleProcedureModel;
  }

  // Change status of a treatment branch
  Future<bool> changeStatusTreatmentBranch({
    required TreatmentModel model,
    required bool statusTreat,
  }) async {
    try {
      bool status = await TreatmentServices().changeStatusTreatmentBranch(
        treatmentBranchId: model.treatmentBranchId!,
        isActive: statusTreat,
      );
      if (status) {
        treatments.removeWhere(
          (element) => element.treatmentBranchId == model.treatmentBranchId,
        );
      }

      notifyListeners();
      return status;
    } catch (e) {
      return false;
    }
  }

  TextEditingController procedureNameController = TextEditingController();

  // Save procedure
  Future<bool> saveProcedure({required TreatmentModel model}) async {
    try {
      bool status = await TreatmentServices().saveProcedure(
        treatmentBranchId: model.treatmentBranchId!,
        procedureName: procedureNameController.text,
      );
      return status;
    } catch (e) {
      return false;
    }
  }
}
