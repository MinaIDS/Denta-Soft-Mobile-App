import 'package:denta_soft/models/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/PatientModel.dart';
import '../../../services/PatioentServices.dart';
import '../../Widget/shared/base_notifier.dart';

class PatientsViewModel extends BaseNotifier {
  final BuildContext context;
  var searchController = TextEditingController();
  var refreshController = RefreshController();
  var isLoading = false;
  var scrollController = ScrollController();
  var isSearching = false;

  List<PatientModel> _patientsList = [];
  List<PatientModel> _filterdList = [];

  List<PatientModel> get patientsList => _filterdList;

  PatientsViewModel(this.context) {
    searchController.addListener(() {
      if (isLoading) {
        return;
      }
      final resultList =
          _patientsList.where((p) {
            print(p.patientName);

            return p.patientName!.toLowerCase().contains(
              searchController.text.toLowerCase(),
            );
          }).toList();
      _filterdList = resultList;
      setState();
    });
    scrollController.addListener(() {
      FocusScope.of(context).unfocus();
    });
  }

  Future<void> searchForPatient() async {
    try {
      isLoading = true;
      final patients = await PatientServices().postSearchPatients();
      _patientsList = patients;
      _filterdList = patients;
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      setState();
    }
  }

  Future<void> onFilter({SearchModel? searchModel}) async {
    try {
      isSearching = true;
      setState();
      final patients = await PatientServices().postSearchPatients(
        searchModel: searchModel!,
      );
      _patientsList = patients;
      _filterdList = patients;
    } catch (e) {
      print(e);
    } finally {
      isSearching = false;
      setState();
    }
  }

  Future<void> onRefresh() async {
    final patients = await PatientServices().postSearchPatients();
    _patientsList = patients;
    _filterdList = patients;
    setState();
    refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.removeListener(() {});
    searchController.dispose();
    refreshController.dispose();
    scrollController.dispose();
  }
}
