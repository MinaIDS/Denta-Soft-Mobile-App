import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/HomeScreens/FinancialScreens/AddEditFinancialScreen.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/FinancialController.dart';
import '../../../../models/IOComeModel.dart';
import '../../../../utils/localization/Localizations.dart';
import '../../../../widgets/OnceFutureBuilder.dart';

class FinancialScreen extends StatelessWidget {
  // Nullable variables should be properly initialized
  late BuildContext _context;
  late final FinancialController model;
  late final Size screenSize;

  final style1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 14,
  );

  final style2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    _context = context;
    model = Provider.of<FinancialController>(context, listen: true);
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          model.isHaveData = false;
          model.selectedIOCome = IOComeModel();
          GoTo.screen(context, AddEditFinancialScreen());
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await model.getIOComes();
        },
        child: OnceFutureBuilder(
          future: () => model.getIOComes(),
          builder: (context, snapShot) {
            if (snapShot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Search
                  searchWidget(),

                  // Balance Widget
                  balanceWidget(context),

                  // List Of Data
                  listOfData(context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 4),
          // From Date
          Text(S().FROM, style: style2),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!, width: 1),
              ),
              child: Text(
                DateFormat.yMMMd().format(DateTime.parse(model.fromDate)),
                style: style2,
              ),
            ),
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: _context,
                initialDate: DateTime.parse(model.fromDate),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null) {
                model.updateStartDate(selectedDate);
              }
            },
          ),

          // To Date
          Text(S().TO, style: style2),
          InkWell(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!, width: 1),
              ),
              child: Text(
                DateFormat.yMMMd().format(DateTime.parse(model.toDate)),
                style: style2,
              ),
            ),
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: _context,
                initialDate: DateTime.parse(model.toDate),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null) {
                model.updateToDate(selectedDate);
              }
            },
          ),

          // Search button
          InkWell(
            child: Container(
              padding: EdgeInsets.all(6),
              child: Row(
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(S().Search, style: TextStyle(color: Colors.white)),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onTap: () {
              model.getIOComes();
            },
          ),
        ],
      ),
    );
  }

  Widget balanceWidget(context) {
    return Card(
      color: ThemeColors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: screenSize.height * .14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S().ProfitMargin,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  "\$${model.totalBalance}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        model.totalBalance < 0
                            ? ThemeColors.danger
                            : ThemeColors.success,
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),

          //Line ____________
          Container(width: double.infinity, height: 1, color: Colors.grey[300]),

          Row(
            children: [
              // Total InCome
              Expanded(
                child: Container(
                  height: screenSize.height * .1,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+ \$${model.totalIncomeBalance}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.success,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        S().TotalIncome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Line ____________
              Container(
                width: 1,
                height: screenSize.height * .1,
                color: Colors.grey[300],
              ),

              // Total Expanses
              Expanded(
                child: Container(
                  height: screenSize.height * .1,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "- \$${model.totalOutcomeBalance}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red[500],
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Total Expanses",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listOfData(context) {
    return Container(
      height: screenSize.height * .5,
      color: Color(0xffebf0f2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child:
            model.isLoading
                ? Center(child: CircularProgressIndicator())
                : model.IOComeList.isEmpty
                ? EmptyScreenWidget(assetPath: AssetsRoutes.noDataAvailable)
                : ListView.separated(
                  itemBuilder: (ctx, index) {
                    IOComeModel ioComeModel = model.IOComeList[index];
                    return Column(
                      children: [
                        itemWidget(ioComeModel),
                        if (index == model.IOComeList.length - 1)
                          SizedBox(height: screenSize.height * .08),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: model.IOComeList.length,
                  shrinkWrap: true,
                ),
      ),
    );
  }

  Widget itemWidget(IOComeModel ioComeModel) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status (Arrows)
          Container(
            width: screenSize.width * .2,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Icon(
                    ioComeModel.type == 1
                        ? Icons.arrow_circle_down_sharp
                        : Icons.arrow_circle_up_rounded,
                    color:
                        ioComeModel.type == 1
                            ? ThemeColors.success
                            : ThemeColors.danger,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  ioComeModel.type == 1 ? S().Income : S().Expanses,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ioComeModel.type == 1 ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Body
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(
                    _context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${S().Amount} : ${ioComeModel.amount.toString()}',
                          style: style1,
                        ),
                        Text(
                          '${S().Category} : ${AppLocalizations.of(_context)!.translate(ioComeModel.category!)}',
                          style: style1,
                        ),
                        Text(
                          '${S().CreationDate} : ${DateFormat.yMMMd().format(DateTime.parse(ioComeModel.happenDate.toString()))}',
                          style: style1,
                        ),
                      ],
                    ),
                    tilePadding: EdgeInsets.symmetric(horizontal: 12),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: EdgeInsets.all(8),
                    expandedAlignment: Alignment.centerLeft,
                    children: <Widget>[
                      Text(
                        'REFERENCEID : ${ioComeModel.referenceId.toString()}',
                        style: style1,
                      ),
                      Text(
                        '${S().Comments} : ${ioComeModel.comments.toString()}',
                        style: style1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Edit and Delete buttons
          Column(
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.close, color: Colors.red, size: 20),
                ),
                onTap: () async {
                  AwesomeDialog(
                    context: _context,
                    dialogType: DialogType.question,
                    animType: AnimType.bottomSlide,
                    title: "",
                    desc: S().Areyousureyouwanttodelete,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      model.deleteInsuranceCompany(
                        id: ioComeModel.incomexpansesDoctorsId!,
                      );
                    },
                  )..show();
                },
              ),
              SizedBox(height: 4),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.edit, color: ThemeColors.primary, size: 20),
                ),
                onTap: () {
                  model.isHaveData = true;
                  model.selectedIOCome = ioComeModel;
                  GoTo.screen(_context, AddEditFinancialScreen(isEdit: true));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
