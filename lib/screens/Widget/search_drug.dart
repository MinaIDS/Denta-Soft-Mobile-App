import 'package:denta_soft/models/SearchProductModel.dart';

import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/widgets/buttons/accent_button.dart';
import 'package:flutter/material.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchDrug extends StatefulWidget {
  final ValueSetter<List<SearchProductModel>>? onSearch;
  final List<SearchProductModel>? drugs;

  const SearchDrug({super.key, this.onSearch, this.drugs});

  @override
  _SearchDrugState createState() => _SearchDrugState();
}

class _SearchDrugState extends State<SearchDrug> {
  // late FloatingSearchBarController _searchController;

  bool isSearching = false;
  List<SearchProductModel> drugsList = [];
  List<SearchProductModel> selectedDrugs = [];

  @override
  void initState() {
    // _searchController = FloatingSearchBarController();
    selectedDrugs = widget.drugs ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 90, bottom: 65),
            child: ListView(
              children: selectedDrugs
                  .map(
                    (d) => Card(
                      elevation: 0.5,
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: ListTile(
                        dense: true,
                        leading: Text(
                          (selectedDrugs.indexOf(d) + 1).toString(),
                        ),
                        title: Text(d.productEn!),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDrugs.remove(d);
                            });
                          },
                          child: Icon(Icons.delete_forever, color: Colors.red),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Positioned(
            bottom: 15,
            child: AccentButton(
              text: 'Add',
              onPressed: () {
                if (widget.onSearch != null) {
                  widget.onSearch!(selectedDrugs);
                }
                Navigator.of(context).pop();
              },
              height: 40,
              width: SizeandStyleUtills().screenWidth * 0.8,
            ),
          ),
          Transform.translate(
            offset: Offset(0, 20),
            child: buildFloatingSearchBar(context),
          ),
          Container(
            height: 3,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    return Column();
  }

  //     controller: _searchController,
  //     hint: 'Search For Drug',
  //     hintStyle: const TextStyle(color: Colors.black),
  //     queryStyle: const TextStyle(color: Colors.black),
  //     transitionDuration: const Duration(milliseconds: 200),
  //     physics: const BouncingScrollPhysics(),
  //     openAxisAlignment: 0.0,
  //     backgroundColor: Colors.white,
  //     iconColor: Colors.black,
  //     debounceDelay: const Duration(milliseconds: 500),
  //     progress: isSearching,
  //     onQueryChanged: (query) async {
  //       if (query.length < 3) {
  //         return;
  //       }
  //       setState(() {
  //         isSearching = true;
  //       });
  //       final result = await SearchProductServices().getSearchProuducts(
  //         productName: query,
  //       );
  //       drugsList = result;
  //       setState(() {
  //         isSearching = false;
  //       });
  //     },
  //     transition: ExpandingFloatingSearchBarTransition(),
  //     actions: [
  //       FloatingSearchBarAction.searchToClear(
  //         showIfClosed: true,
  //         color: Colors.grey,
  //       ),
  //     ],
  //     builder: (context, transition) {
  //       return ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children:
  //               drugsList
  //                   .map(
  //                     (d) => Material(
  //                       color: Colors.white,
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           InkWell(
  //                             onTap: () {
  //                               _searchController.clear();
  //                               _searchController.close();
  //                               setState(() {
  //                                 if (!selectedDrugs.contains(d)) {
  //                                   selectedDrugs.add(d);
  //                                 }
  //                               });
  //                             },
  //                             child: Container(
  //                               width: double.infinity,
  //                               padding: const EdgeInsets.symmetric(
  //                                 horizontal: 10,
  //                                 vertical: 15,
  //                               ),
  //                               child: Text(
  //                                 '${d.productEn}',
  //                                 style: TextStyle(
  //                                   color: Colors.indigo,
  //                                   fontWeight: FontWeight.w600,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           Divider(height: 0),
  //                         ],
  //                       ),
  //                     ),
  //                   )
  //                   .toList(),
  //         ),
  //       );
  //     },
  //   );
  // }
}
