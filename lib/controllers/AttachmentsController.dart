import 'package:denta_soft/controllers/DiseaseController.dart';
import 'package:denta_soft/models/DiseaseModel.dart';
import 'package:denta_soft/models/SearchProductModel.dart';
import 'package:denta_soft/services/AttachmentsServices.dart';
import 'package:denta_soft/services/PatioentServices.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:denta_soft/models/AttachmentsModel';

class AttachmentsController extends ChangeNotifier {
  List<AttachmentsModel> attachmentsXRay = [];
  List<AttachmentsModel> attachmentsIntraoral = [];
  List<AttachmentsModel> attachmentsExtraoral = [];

  List<AttachmentsModel> attachmentsModel = [];

  // get attachmentsModel
  Future<List<AttachmentsModel>> getAttachments({String? patientId}) async {
    try {
      // Check if patientId is null and handle the case accordingly
      if (patientId == null) {
        // Handle null case: throw an error, return an empty list, or whatever suits your app
        throw Exception("patientId cannot be null");
      }

      attachmentsModel = await AttachmentsServices().getAttachments(patientId);
      print('test ${attachmentsModel.length}');

      if (attachmentsModel.isNotEmpty) {
        // Handle logic if necessary
      }

      attachmentsModel.forEach((element) {
        switch (element.attachmentType) {
          case 'XRay':
            attachmentsXRay.add(element);
            break;
          case 'Intraoral':
            attachmentsIntraoral.add(element);
            break;
          case 'Extraoral':
            attachmentsExtraoral.add(element);
            break;
          default:
            break;
        }
      });

      return attachmentsModel;
    } catch (e) {
      return attachmentsModel;
    }
  }

  Future<bool> saveAttachmentsProfile(
    BuildContext context,
    FormData body,
    String patientId,
  ) async {
    // start loading
    isLoading = true;

    notifyListeners();

    bool status = false;
    try {
      status = await PatientServices().saveAttachmentsProfile(body: body);

      // stop loading
      isLoading = false;
      notifyListeners();

      if (status) {
        return status;
      }
      return status;
    } catch (e) {
      return status;
    }
  }

  bool isLoading = false;

  Future<bool> deleteAttachments({AttachmentsModel? model}) async {
    isLoading = true;
    notifyListeners();

    try {
      if (model == null) return false;

      bool status = await AttachmentsServices().deleteAttachments(
        AttachmentId: model.patientAttachmentId!,
      );
      if (status) {
        switch (model.attachmentType) {
          case 'XRay':
            attachmentsXRay.removeWhere(
              (element) =>
                  element.patientAttachmentId == model.patientAttachmentId,
            );
            break;
          case 'Intraoral':
            attachmentsIntraoral.removeWhere(
              (element) =>
                  element.patientAttachmentId == model.patientAttachmentId,
            );
            break;
          case 'Extraoral':
            attachmentsExtraoral.removeWhere(
              (element) =>
                  element.patientAttachmentId == model.patientAttachmentId,
            );
            break;
          default:
            break;
        }
      }
      isLoading = false;
      notifyListeners();

      return status;
    } catch (e) {
      return false;
    }
  }

  var medicalHistoryKey = GlobalKey<FormState>();

  List<PatientDisease> addedDisease = [PatientDisease()];
  List<DiseaseModel> diseasesList = [];
  List<SearchProductModel> drugsList = [];

  addaddedDisease(PatientDisease patientDisease) {
    addedDisease.add(patientDisease);
    notifyListeners();
  }

  updateaddedDisease(index, value) {
    addedDisease[index].diseaseId = value;
    notifyListeners();
  }

  deleteaddedDisease(index) {
    addedDisease.removeAt(index);
    notifyListeners();
  }

  updatedrugsList(value) {
    drugsList = value;
    notifyListeners();
  }

  deletedrugsList(SearchProductModel drug) {
    drugsList.remove(drug);
    notifyListeners();
  }

  Future<void> getDieasesList() async {
    final disease = await DiseaseController().getDiseases();
    diseasesList.addAll(disease);
    notifyListeners();
  }

  @override
  void dispose() {
    addedDisease.forEach((d) {
      d.comment.dispose();
    });
    super.dispose();
  }
}

class PatientDisease {
  int diseaseId = 0; // Initialized with 0 to avoid null issues
  var comment = TextEditingController();
}
