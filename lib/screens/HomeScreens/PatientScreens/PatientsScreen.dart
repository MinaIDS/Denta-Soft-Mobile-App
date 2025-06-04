import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../items/PetientItemWidget.dart';
import '../../../utils/GlobalData.dart';
import '../../../utils/GoTo.dart';
import '../../../utils/SizesStatic.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../DrawerScreens/app_drawer.dart';
import '../../Widget/custom_appBar.dart';
import '../../Widget/shared/base_widget.dart';
import 'SearchFilterScreen.dart';
import 'add_patient/AddPatientScreen.dart';
import '../../../controllers/PatientsScreenController.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  void initState() {
    GlobalData.globalContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PatientsScreenController>(
      model: PatientsScreenController(context),
      initState: (m) => m.searchForPatient(),
      builder: (ctx, model, local, _) => Scaffold(
        appBar: buildAppBar(context, model),
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => GoTo.screen(context, AddPatientScreen()),
          child: Icon(Icons.add),
        ),
        body: model.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (model.isSearching)
                    LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      backgroundColor: Colors.white,
                    ),
                  Expanded(
                    child: SmartRefresher(
                      controller: model.refreshController,
                      enablePullDown: true,
                      onRefresh: model.onRefresh,
                      child: model.patientsList.isEmpty
                          ? Center(
                              child: EmptyScreenWidget(
                                assetPath: AssetsRoutes.noDataAvailable,
                              ),
                            )
                          : ListView.separated(
                              controller: model.scrollController,
                              primary: false,
                              itemBuilder: (context, index) =>
                                  PatientItemWidget(
                                    patientModel: model.patientsList[index],
                                  ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: model.patientsList.length,
                            ),
                    ),
                  ),
                ],
              ),
      ),

      //     RefreshIndicator(
      //   onRefresh: () async {
      //     final _patientsList =
      //         await PatientController().postSearchPatients(patientName: "");
      //     search.clear();
      //     setState(() {
      //       patientsList = _patientsList;
      //     });
      //     return true;
      //   },
      //   child: Column(
      //     children: [
      //       // getSearchBarUI(context),
      //       OnceFutureBuilder(
      //         future: () =>
      //             PatientController().postSearchPatients(patientName: ""),
      //         builder: (BuildContext context, AsyncSnapshot<dynamic> snapShot) {
      //           if (snapShot.connectionState != ConnectionState.done) {
      //             return Expanded(
      //                 child: Center(child: CircularProgressIndicator()));
      //           } else {
      //             if (!isPageLoaded) {
      //               patientsList = snapShot.data;
      //               isPageLoaded = true;
      //             }
      //             return Expanded(
      //                 child: SingleChildScrollView(
      //               child: Container(
      //                 margin:
      //                     EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      //                 decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //                     boxShadow: [
      //                       BoxShadow(color: Colors.black12, blurRadius: 2.0)
      //                     ]),
      //                 child: Column(
      //                   children: [
      //                     ListView.builder(
      //                         itemCount: patientsList.length,
      //                         physics: NeverScrollableScrollPhysics(),
      //                         shrinkWrap: true,
      //                         itemBuilder: (context, index) {
      //                           //if last Item make space on bottom list
      //                           if (patientsList.length - 1 == index) {
      //                             return Column(
      //                               children: [
      //                                 SpaceHeight_XXL,
      //                                 SpaceHeight_XXL,
      //                                 SpaceHeight_XL,
      //                               ],
      //                             );
      //                           }
      //                           return Column(
      //                             children: [
      //                               PatientItemWidget(
      //                                   patientModel: patientsList[index]),
      //                               patientsList.length - 1 != index
      //                                   ? Padding(
      //                                       padding: const EdgeInsets.symmetric(
      //                                           horizontal: 10),
      //                                       child: Divider(),
      //                                     )
      //                                   : Container()
      //                             ],
      //                           );
      //                         }),
      //                   ],
      //                 ),
      //               ),
      //             ));
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  AppBar buildAppBar(BuildContext context, PatientsScreenController model) {
    return CustomAppBar.customAppBar(
      title: S().EC6,
      elevations: 2,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: model.searchController,
                  hint: S().Search,
                  filled: true,
                  noborder: true,
                  filledColor: Colors.grey[100]!,
                  suffixIcon: model.searchController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            model.searchController.clear();
                          },
                          child: Icon(Icons.clear),
                        )
                      : Icon(Icons.search),
                ),
              ),
              SpaceWidth_L,
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                    ),
                    builder: (ctx) => DraggableScrollableSheet(
                      maxChildSize: 0.95,
                      initialChildSize: 0.95,
                      builder: (ctx, scrollController) => SearchFilterScreen(
                        onSearch: (v) {
                          model.onFilter(searchModel: v);
                        },
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.filter_list_alt,
                  size: 30,
                  color: ThemeColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget getSearchBarUI(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 8.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: <Widget>[
  //         Container(
  //           width: MediaQuery.of(context).size.width * 0.85,
  //           height: 64,
  //           child: Padding(
  //             padding: const EdgeInsets.only(top: 8, bottom: 8),
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 // color: HexColor('#F8FAFB'),
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(13),
  //               ),
  //               child: Row(
  //                 children: <Widget>[
  //                   Expanded(
  //                     child: Container(
  //                       padding: const EdgeInsets.only(left: 16, right: 16),
  //                       child: TextFormField(
  //                         controller: search,
  //                         style: TextStyle(
  //                           fontFamily: 'WorkSans',
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 16,
  //                           color: Colors.blueAccent,
  //                         ),
  //                         keyboardType: TextInputType.text,
  //                         textInputAction: TextInputAction.search,
  //                         decoration: InputDecoration(
  //                           labelText: 'Search for Patients',
  //                           border: InputBorder.none,
  //                           helperStyle: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 16,
  //                             color: HexColor('#B9BABC'),
  //                           ),
  //                           labelStyle: TextStyle(
  //                             fontWeight: FontWeight.w600,
  //                             fontSize: 16,
  //                             letterSpacing: 0.2,
  //                             color: HexColor('#B9BABC'),
  //                           ),
  //                         ),
  //                         onFieldSubmitted: (v) async {
  //                           final _patientsList = await PatientController()
  //                               .postSearchPatients(patientName: v);
  //                           setState(() {
  //                             patientsList = _patientsList;
  //                           });
  //                         },
  //                         onChanged: (v) async {
  //                           if (v.isEmpty) {
  //                             final _patientsList = await PatientController()
  //                                 .postSearchPatients(patientName: v);
  //                             setState(() {
  //                               patientsList = _patientsList;
  //                             });
  //                           }
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   ClipRRect(
  //                     borderRadius: BorderRadius.circular(13),
  //                     child: FlatButton(
  //                       padding: EdgeInsets.all(0),
  //                       onPressed: () async {
  //                         final _patientsList = await PatientController()
  //                             .postSearchPatients(
  //                                 patientName: search.text.trim());
  //                         setState(() {
  //                           patientsList = _patientsList;
  //                         });
  //                       },
  //                       child: SizedBox(
  //                         width: 60,
  //                         height: 60,
  //                         child: Icon(Icons.search, color: HexColor('#B9BABC')),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         SpaceWidth_XS,
  //         Row(
  //           children: [
  //             InkWell(
  //                 onTap: () {
  //                   print("clicked");

  //                   GoTo.screen(context, SearchFilterScreen());
  //                 },
  //                 child: Icon(Icons.filter_list,
  //                     size: 30, color: ThemeColors.primary)),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
