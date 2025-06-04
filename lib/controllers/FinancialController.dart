import 'package:flutter/material.dart';
import '../models/IOComeModel.dart';
import '../services/FinancialServices.dart';

class FinancialController extends ChangeNotifier {
  bool isHaveData = false;

  List<IOComeModel> IOComeList = [];
  IOComeModel selectedIOCome = IOComeModel();

  String fromDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
    DateTime.now().hour,
    DateTime.now().minute,
  ).toString();
  String toDate = DateTime.now().toString();
  double totalIncomeBalance = 0.0;
  double totalOutcomeBalance = 0.0;
  double totalBalance = 0.0;

  bool isLoading = false;

  // Get income/expenses list
  Future<List<IOComeModel>> getIOComes() async {
    isLoading = true;
    notifyListeners();

    try {
      IOComeList = await FinancialServices().getIOComes(
        from: fromDate,
        to: toDate,
      );

      totalIncomeBalance = 0.0;
      totalOutcomeBalance = 0.0;
      totalBalance = 0.0;

      for (var element in IOComeList) {
        if (element.type == 1) {
          totalIncomeBalance += element.amount!;
        } else if (element.type == 0) {
          totalOutcomeBalance += element.amount!;
        }
      }
      totalBalance = totalIncomeBalance - totalOutcomeBalance;
    } catch (e) {
      print("Error fetching income/outcome: $e");
    }

    isLoading = false;
    notifyListeners();

    return IOComeList;
  }

  // Save income/expense
  Future<void> saveIOCome(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    bool status = false;
    try {
      status = await FinancialServices().saveIOCome(
        selectedIOCome: selectedIOCome,
      );
    } catch (e) {
      print("Error saving income/expense: $e");
    }

    if (status) {
      Navigator.of(context).pop();
      await getIOComes(); // Refresh the list
    }

    isLoading = false;
    notifyListeners();
  }

  // Delete insurance company
  Future<void> deleteInsuranceCompany({required String id}) async {
    isLoading = true;
    notifyListeners();

    bool status = await FinancialServices().deleteInsuranceCompany(id: id);

    if (status) {
      IOComeList.removeWhere((element) => element.incomexpansesDoctorsId == id);

      // Recalculate balances after removal
      totalIncomeBalance = 0.0;
      totalOutcomeBalance = 0.0;
      totalBalance = 0.0;

      for (var element in IOComeList) {
        if (element.type == 1) {
          totalIncomeBalance += element.amount!;
        } else if (element.type == 0) {
          totalOutcomeBalance += element.amount!;
        }
      }
      totalBalance = totalIncomeBalance - totalOutcomeBalance;
    }

    isLoading = false;
    notifyListeners();
  }

  // Update start date
  void updateStartDate(DateTime newDate) {
    fromDate = newDate.toString();
    notifyListeners();
  }

  // Update end date
  void updateToDate(DateTime newDate) {
    toDate = newDate.toString();
    notifyListeners();
  }

  // Type data for income/expense
  List<Map<String, dynamic>> typeData = [
    {"Code": 0, "Value": "Expenses"},
    {"Code": 1, "Value": "Income"},
  ];

  // Category data for income/expense
  List<Map<String, dynamic>> categoryData = [
    {"Code": "EC1", "Value": "Monthly Payments"},
    {"Code": "EC2", "Value": "Material"},
    {"Code": "EC3", "Value": "Office Supply"},
    {"Code": "EC4", "Value": "Dental Lab"},
    {"Code": "EC5", "Value": "Food Supply"},
    {"Code": "EC6", "Value": "Patient"},
    {"Code": "EC7", "Value": "Others"},
  ];

  // Select a date for income/expense
  Future<void> selectDate(BuildContext context) async {
    DateTime selectedDate =
        await showDatePicker(
          context: context,
          initialDate: isHaveData ? selectedIOCome.happenDate : DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101),
        ) ??
        DateTime.now();

    selectedIOCome.happenDate = selectedDate;
    notifyListeners();
  }

  // Select category for income/expense
  Future<void> selectCategory(Map<String, dynamic> v) async {
    selectedIOCome.category = v['Code'];
    notifyListeners();
  }

  // Select comment for income/expense
  Future<void> selectComment(String v) async {
    selectedIOCome.comments = v;
    notifyListeners();
  }

  // Select amount for income/expense
  Future<void> selectAmount(double v) async {
    selectedIOCome.amount = v;
    notifyListeners();
  }

  // Select reference ID for income/expense
  Future<void> selectReferenceID(String v) async {
    selectedIOCome.referenceId = v;
    notifyListeners();
  }
}
