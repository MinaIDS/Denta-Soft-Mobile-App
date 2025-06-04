import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/DiseaseController.dart';
import '../../../../controllers/PatientController.dart';
import '../../../../controllers/SearchProductController.dart';
import '../../../../items/ConfirmShowModalBottomSheet.dart';
import '../../../../models/DiseaseModel.dart';
import '../../../../models/PatientModel.dart';
import '../../../../models/SearchProductModel.dart';
import '../../../../utils/SizeandStyleUtills.dart';
import '../../../../utils/SizesStatic.dart';
import '../../../../widgets/OnceFutureBuilder.dart';

class MedicalRecordTab extends StatefulWidget {
  final PatientModel? patient;

  const MedicalRecordTab({super.key, this.patient});

  @override
  _MedicalRecordTabState createState() => _MedicalRecordTabState();
}

class _MedicalRecordTabState extends State<MedicalRecordTab> {
  int tabIndex = 1;

  Size? scrennSize;
  List<Diease> dieasesList = [];
  List<ProductViewModel> productsList = [];
  List<DiseaseModel> allDieasesList = [];
  String? searchProduct;
  List<int> productDieasesId = [];
  List<SearchProductModel> searchProductsList = [];
  List<SearchProductModel> selectedProductsInSearchList = [];
  TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  bool isLoadingDialog = false;
  bool dieaseSelected = false;

  final style1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 14,
  );

  final style2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 10,
  );

  @override
  Widget build(BuildContext context) {
    scrennSize = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        await PatientController().getPatientDetails(
          patientId: widget.patient!.patientId,
        );
      },
      child: OnceFutureBuilder(
        future: () => PatientController().getPatientDiseases(
          patientId: widget.patient!.patientId,
        ),
        builder: (context, snapShot) {
          if (snapShot.connectionState != ConnectionState.done) {
            return SizedBox(
              height: scrennSize!.height * .8,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          dieasesList = snapShot.data as List<Diease>;
          return Stack(
            children: [
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: scrennSize!.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                tabIndex = 1;
                                dieasesList.clear();
                                setState(() {
                                  isLoading = true;
                                });
                                dieasesList.addAll(
                                  await PatientController().getPatientDiseases(
                                    patientId: widget.patient!.patientId,
                                  ),
                                );
                                isLoading = false;
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: 145,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                  vertical: SizeandStyleUtills()
                                      .getProportionalHeight(height: 15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: tabIndex == 1
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(
                                    color: tabIndex == 1
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  S().DieasesType,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: tabIndex == 1
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SpaceWidth_M,
                            InkWell(
                              onTap: () async {
                                tabIndex = 2;

                                productsList.clear();
                                setState(() {
                                  isLoading = true;
                                });
                                productsList.addAll(
                                  await PatientController().getPatientProducts(
                                    patientId: widget.patient!.patientId,
                                  ),
                                );
                                isLoading = false;
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: 145,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                  vertical: SizeandStyleUtills()
                                      .getProportionalHeight(height: 15),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: tabIndex == 2
                                      ? Colors.blue
                                      : Colors.white,
                                  border: Border.all(
                                    color: tabIndex == 2
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                child: Text(
                                  S().Products,
                                  style: TextStyle(
                                    color: tabIndex == 2
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // List Of Data
                      tabIndex == 1
                          ? listOfData(context)
                          : listOfProductData(context),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return ShowModalSheetConfirmation(
                              title: S().All,
                              onTapFunction: () async {
                                print('confirm');
                                Navigator.pop(context);
                                setState(() {
                                  isLoading = true;
                                });
                                List<String> ids = [];
                                for (var element in dieasesList) {
                                  ids.add(element.diseaseId!);
                                }
                                bool status = await PatientController()
                                    .deleteDisease(ids: ids);
                                if (status) {
                                  dieasesList.clear();
                                }
                                isLoading = false;
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        width: SizeandStyleUtills().getProportionalWidth(
                          width: 150,
                        ),
                        height: SizeandStyleUtills().getProportionalHeight(
                          height: 50,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            S().DeleteAll,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SpaceWidth_XL,
                    InkWell(
                      onTap: () async {
                        print("add");
                        // Dieases Tab List
                        if (tabIndex == 1) {
                          allDieasesList.clear();
                          setState(() {
                            isLoadingDialog = true;
                          });
                          allDieasesList.addAll(
                            await DiseaseController().getDiseases(),
                          );
                          for (var dieases in dieasesList) {
                            allDieasesList.removeWhere(
                              (element) => dieases.diseaseTypeId == element.id,
                            );
                          }
                          setState(() {
                            isLoadingDialog = false;
                          });
                          await showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                ),
                                child: isLoadingDialog
                                    ? Center(child: CircularProgressIndicator())
                                    : allDieasesList.isEmpty
                                    ? Center(
                                        child: Text(S().showNoDataAvailable),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.separated(
                                          itemBuilder: (ctx, index) {
                                            DiseaseModel dieaseModel =
                                                allDieasesList[index];
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8.0,
                                                          ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                          setState(() {
                                                            isLoading = true;
                                                          });
                                                          print(dieaseModel.id);
                                                          bool
                                                          status = await DiseaseController()
                                                              .saveDisease(
                                                                diseaseModel:
                                                                    dieaseModel,
                                                                patientId: widget
                                                                    .patient!
                                                                    .patientId!,
                                                              );
                                                          if (status) {
                                                            print("added");

                                                            dieasesList.clear();
                                                            dieasesList.addAll(
                                                              await PatientController()
                                                                  .getPatientDiseases(
                                                                    patientId: widget
                                                                        .patient!
                                                                        .patientId,
                                                                  ),
                                                            );
                                                          }
                                                          isLoading = false;
                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          dieaseModel.value!,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    // dieaseSelected
                                                    //     ? Icon(Icons.check)
                                                    //     : Container(),
                                                  ],
                                                ),
                                                if (index ==
                                                    allDieasesList.length - 1)
                                                  SizedBox(
                                                    height:
                                                        scrennSize!.height * .1,
                                                  ),
                                              ],
                                            );
                                          },
                                          separatorBuilder: (ctx, index) {
                                            return Divider();
                                          },
                                          itemCount: allDieasesList.length,
                                          shrinkWrap: true,
                                        ),
                                      ),
                              );
                            },
                          );
                        }
                        // Products Tab List
                        else {
                          searchController.clear();
                          searchProductsList.clear();
                          await showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Consumer<SelectProductsProvider>(
                                builder: (context, selectProductsProvider, child) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              // Search Box
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 30,
                                                  vertical: 12,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  controller: searchController,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  onFieldSubmitted: (v) async {
                                                    searchProductsList.clear();
                                                    setState(() {
                                                      isLoadingDialog = true;
                                                    });
                                                    searchProductsList.addAll(
                                                      await SearchProductController()
                                                          .getProducts(
                                                            searchController
                                                                .text,
                                                          ),
                                                    );
                                                    selectProductsProvider
                                                        .setAllProductCheck(
                                                          List<bool>.filled(
                                                            searchProductsList
                                                                .length,
                                                            false,
                                                          ),
                                                        );
                                                    print(
                                                      "product List:${searchProductsList.length}",
                                                    );
                                                    isLoadingDialog = false;
                                                    setState(() {});
                                                    FocusScope.of(
                                                      context,
                                                    ).requestFocus(FocusNode());
                                                  },
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    suffixIcon: InkWell(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: 1,
                                                            height: 30,
                                                            color: Colors
                                                                .grey[200],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  8.0,
                                                                ),
                                                            child: Icon(
                                                              Icons.search,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      onTap: () async {
                                                        searchProductsList
                                                            .clear();
                                                        setState(() {
                                                          isLoadingDialog =
                                                              true;
                                                        });
                                                        searchProductsList.addAll(
                                                          await SearchProductController()
                                                              .getProducts(
                                                                searchController
                                                                    .text,
                                                              ),
                                                        );
                                                        selectProductsProvider
                                                            .setAllProductCheck(
                                                              List<bool>.filled(
                                                                searchProductsList
                                                                    .length,
                                                                false,
                                                              ),
                                                            );
                                                        print(
                                                          "product List:${searchProductsList.length}",
                                                        );
                                                        isLoadingDialog = false;
                                                        setState(() {});
                                                        FocusScope.of(
                                                          context,
                                                        ).requestFocus(
                                                          FocusNode(),
                                                        );
                                                      },
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                          left: 15,
                                                          bottom: 11,
                                                          top: 11,
                                                          right: 15,
                                                        ),
                                                    hintText: S().Search_Here,
                                                  ),
                                                  validator: (value) {
                                                    return value!.isEmpty
                                                        ? "product name is required"
                                                        : value.length < 3
                                                        ? "product name must be 3 character"
                                                        : null;
                                                  },
                                                ),
                                              ),

                                              isLoadingDialog
                                                  ? SizedBox(
                                                      height: SizeandStyleUtills()
                                                          .getProportionalHeight(
                                                            height: 200,
                                                          ),
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    )
                                                  : searchProductsList.isEmpty
                                                  ? SizedBox(
                                                      height: SizeandStyleUtills()
                                                          .getProportionalHeight(
                                                            height: 200,
                                                          ),
                                                      child: Center(
                                                        child: Text(
                                                          S().showNoDataAvailable,
                                                        ),
                                                      ),
                                                    )
                                                  : ListView.separated(
                                                      itemBuilder: (ctx, index) {
                                                        SearchProductModel
                                                        product =
                                                            searchProductsList[index];

                                                        return Column(
                                                          children: [
                                                            CheckboxListTile(
                                                              title: Text(
                                                                product
                                                                    .productAr!,
                                                              ),
                                                              value: selectProductsProvider
                                                                  .getProductChecked[index],
                                                              onChanged: (value) {
                                                                print(
                                                                  "SSS::$value",
                                                                );
                                                                selectProductsProvider
                                                                    .setProductCheck(
                                                                      index,
                                                                      value!,
                                                                    );
                                                                if (selectProductsProvider
                                                                    .getProductChecked[index]) {
                                                                  selectedProductsInSearchList
                                                                      .add(
                                                                        product,
                                                                      );
                                                                } else {
                                                                  selectedProductsInSearchList
                                                                      .remove(
                                                                        product,
                                                                      );
                                                                }
                                                                setState(() {});
                                                              },
                                                            ),
                                                            if (index ==
                                                                searchProductsList
                                                                        .length -
                                                                    1)
                                                              SizedBox(
                                                                height:
                                                                    scrennSize!
                                                                        .height *
                                                                    .1,
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (ctx, index) {
                                                            return Divider();
                                                          },
                                                      itemCount:
                                                          searchProductsList
                                                              .length,
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 12,
                                        left: 0,
                                        right: 0,
                                        child: // Add Button
                                        SizedBox(
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              List<int> ids = [];
                                              for (var element
                                                  in selectedProductsInSearchList) {
                                                print(
                                                  "SSSPP::${selectedProductsInSearchList.length}",
                                                );

                                                ids.add(element.productId!);
                                                print("ids:$ids");
                                              }
                                              bool status =
                                                  await SearchProductController()
                                                      .saveProductDiease(
                                                        productIds: ids,
                                                        patientId: widget
                                                            .patient!
                                                            .patientId!,
                                                      );
                                              if (status) {
                                                print("added");

                                                productsList =
                                                    await PatientController()
                                                        .getPatientProducts(
                                                          patientId: widget
                                                              .patient!
                                                              .patientId!,
                                                        );
                                              }
                                              isLoading = false;
                                              setState(() {});
                                            },
                                            child: Text(S().Add),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: SizeandStyleUtills().getProportionalWidth(
                          width: 150,
                        ),
                        height: SizeandStyleUtills().getProportionalHeight(
                          height: 50,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text(
                            S().Add,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // List of Data
  Widget listOfData(context) {
    return Container(
      height: scrennSize!.height * .8,
      color: Color(0xffebf0f2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : dieasesList.isEmpty
            ? Center(child: Text(S().showNoDataAvailable))
            : ListView.separated(
                itemBuilder: (ctx, index) {
                  Diease dieaseModel = dieasesList[index];
                  return Column(
                    children: [
                      itemWidget(dieaseModel),
                      if (index == dieasesList.length - 1)
                        SizedBox(height: scrennSize!.height * .2),
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider();
                },
                itemCount: dieasesList.length,
                shrinkWrap: true,
              ),
      ),
    );
  }

  Widget listOfProductData(context) {
    return Container(
      height: scrennSize!.height * .8,
      color: Color(0xffebf0f2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : productsList.isEmpty
            ? Center(child: Text(S().showNoDataAvailable))
            : ListView.separated(
                itemBuilder: (ctx, index) {
                  ProductViewModel productModel = productsList[index];
                  return Column(
                    children: [
                      itemProductWidget(productModel),
                      if (index == productsList.length - 1)
                        SizedBox(height: scrennSize!.height * .2),
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider();
                },
                itemCount: productsList.length,
                shrinkWrap: true,
              ),
      ),
    );
  }

  // Item
  Widget itemWidget(Diease diease) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status (Arrows)

          // Body
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' ${diease.diseaseName ?? ""}', style: style1),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Buttons
          Column(
            children: [
              // Delete Button
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.delete, color: Colors.white, size: 30),
                ),
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return ShowModalSheetConfirmation(
                        title: diease.diseaseName!,
                        onTapFunction: () async {
                          setState(() {
                            isLoading = true;
                          });
                          Navigator.pop(context);
                          bool status = await PatientController().deleteDisease(
                            ids: [diease.diseaseId!],
                          );
                          if (status) {
                            dieasesList.removeWhere(
                              (element) =>
                                  element.diseaseId == diease.diseaseId,
                            );
                          }
                          isLoading = false;
                          setState(() {});
                        },
                      );
                    },
                  );
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget itemProductWidget(ProductViewModel productViewModel) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status (Arrows)

          // Body
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${productViewModel.productEn} - ${productViewModel.productAr ?? ""}',
                        style: style1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Buttons
          Column(
            children: [
              // Delete Button
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.delete, color: Colors.white, size: 30),
                ),
                onTap: () {
                  productDieasesId.clear();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return ShowModalSheetConfirmation(
                        title: productViewModel.productEn!,
                        onTapFunction: () async {
                          print("productId:${productViewModel.productId}");
                          productDieasesId.add(productViewModel.productId!);
                          bool status = await PatientController()
                              .deletePatientProduct(ids: productDieasesId);
                          setState(() {
                            Navigator.pop(context);
                          });

                          if (status) {
                            productsList.removeWhere(
                              (element) =>
                                  element.productId ==
                                  productViewModel.productId,
                            );
                            setState(() {});
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectProductsProvider extends ChangeNotifier {
  List<bool> _isProductChecked = [];

  setAllProductCheck(List<bool> value) {
    _isProductChecked = value;
    notifyListeners();
  }

  setProductCheck(int index, bool value) {
    _isProductChecked[index] = value;
    notifyListeners();
  }

  get getProductChecked => _isProductChecked;
}
