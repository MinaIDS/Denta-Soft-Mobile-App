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
  final style1 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 14,
  );

  final style2 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    fontSize: 10,
  );

  FinancialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FinancialController>(context, listen: true);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  searchWidget(context, model),
                  balanceWidget(context, model, screenSize),
                  listOfData(context, model, screenSize),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget searchWidget(BuildContext context, FinancialController model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 4),
          Text(S().FROM, style: style2),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
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
                context: context,
                initialDate: DateTime.parse(model.fromDate),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null) {
                model.updateStartDate(selectedDate);
              }
            },
          ),
          Text(S().TO, style: style2),
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
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
                context: context,
                initialDate: DateTime.parse(model.toDate),
                firstDate: DateTime(2015, 8),
                lastDate: DateTime(2101),
              );
              if (selectedDate != null) {
                model.updateToDate(selectedDate);
              }
            },
          ),
          InkWell(
            onTap: () {
              model.getIOComes();
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(S().Search, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget balanceWidget(
    BuildContext context,
    FinancialController model,
    Size screenSize,
  ) {
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  "\$${model.totalBalance}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: model.totalBalance < 0
                        ? ThemeColors.danger
                        : ThemeColors.success,
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),
          Container(width: double.infinity, height: 1, color: Colors.grey[300]),
          Row(
            children: [
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
                      const SizedBox(height: 2),
                      Text(
                        S().TotalIncome,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: screenSize.height * .1,
                color: Colors.grey[300],
              ),
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
                      const SizedBox(height: 4),
                      Text(
                        "Total Expanses",
                        style: const TextStyle(
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

  Widget listOfData(
    BuildContext context,
    FinancialController model,
    Size screenSize,
  ) {
    return Container(
      height: screenSize.height * .5,
      color: const Color(0xffebf0f2),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: model.isLoading
            ? const Center(child: CircularProgressIndicator())
            : model.IOComeList.isEmpty
            ? EmptyScreenWidget(assetPath: AssetsRoutes.noDataAvailable)
            : ListView.separated(
                itemCount: model.IOComeList.length,
                separatorBuilder: (_, __) => const Divider(),
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  final ioCome = model.IOComeList[index];
                  return Column(
                    children: [
                      itemWidget(context, model, ioCome),
                      if (index == model.IOComeList.length - 1)
                        SizedBox(height: screenSize.height * .08),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Widget itemWidget(
    BuildContext context,
    FinancialController model,
    IOComeModel ioComeModel,
  ) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .2,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    ioComeModel.type == 1
                        ? Icons.arrow_circle_down_sharp
                        : Icons.arrow_circle_up_rounded,
                    color: ioComeModel.type == 1
                        ? ThemeColors.success
                        : ThemeColors.danger,
                  ),
                ),
                const SizedBox(height: 4),
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
          Expanded(
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${S().Amount} : ${ioComeModel.amount}',
                      style: style1,
                    ),
                    Text(
                      '${S().Category} : ${AppLocalizations.of(context)!.translate(ioComeModel.category!)}',
                      style: style1,
                    ),
                    Text(
                      '${S().CreationDate} : ${DateFormat.yMMMd().format(ioComeModel.happenDate!)}',
                      style: style1,
                    ),
                  ],
                ),
                tilePadding: const EdgeInsets.symmetric(horizontal: 12),
                childrenPadding: const EdgeInsets.all(8),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Text(
                    'REFERENCEID : ${ioComeModel.referenceId}',
                    style: style1,
                  ),
                  Text(
                    '${S().Comments} : ${ioComeModel.comments}',
                    style: style1,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.question,
                    animType: AnimType.bottomSlide,
                    desc: S().Areyousureyouwanttodelete,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      model.deleteInsuranceCompany(
                        id: ioComeModel.incomexpansesDoctorsId!,
                      );
                    },
                  ).show();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.close, color: Colors.red, size: 20),
                ),
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () {
                  model.isHaveData = true;
                  model.selectedIOCome = ioComeModel;
                  GoTo.screen(context, AddEditFinancialScreen(isEdit: true));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.edit, color: ThemeColors.primary, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
