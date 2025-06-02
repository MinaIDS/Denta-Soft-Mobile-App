import 'package:denta_soft/controllers/UsersScreenController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/items/UserItemWidget.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:denta_soft/widgets/EmptyScreenWidget.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:denta_soft/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'AddUserScreen.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersScreenController>(
      builder:
          (context, model, child) => Scaffold(
            appBar: AppBar(title: Text(S().Users)),
            floatingActionButton: FloatingActionButton(
              onPressed: () => GoTo.screen(context, AddUserScreen()),
              child: Icon(Icons.add),
            ),
            body: OnceFutureBuilder(
              future: () => model.searchForUsers(username: ""),
              builder:
                  (ctx, snpShot) =>
                      model.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Column(
                            children: [
                              buildAppBar(context, model),
                              if (model.isSearching)
                                LinearProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.amber,
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              Expanded(
                                child: SmartRefresher(
                                  controller: model.refreshController,
                                  enablePullDown: true,
                                  onRefresh: model.onRefresh,
                                  child:
                                      model.usersList.isEmpty
                                          ? Center(
                                            child: EmptyScreenWidget(
                                              assetPath:
                                                  AssetsRoutes.noDataAvailable,
                                            ),
                                          )
                                          : ListView.separated(
                                            controller: model.scrollController,
                                            primary: false,
                                            addAutomaticKeepAlives: true,
                                            itemBuilder:
                                                (context, index) =>
                                                    UserItemWidget(
                                                      userModel:
                                                          model
                                                              .usersList[index],
                                                    ),
                                            separatorBuilder:
                                                (context, index) => Divider(),
                                            itemCount: model.usersList.length,
                                          ),
                                ),
                              ),
                            ],
                          ),
            ),
          ),
    );
  }

  Widget buildAppBar(BuildContext context, UsersScreenController model) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 12),
        child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: model.searchController,
                hint: S().Search,
                filled: true,
                noborder: true,
                onChanged: (v) {
                  model.searchForUsers(username: v);
                },
                filledColor: Colors.grey[100]!,
                suffixIcon:
                    model.searchController.text.isNotEmpty
                        ? GestureDetector(
                          onTap: () {
                            model.searchController.clear();
                            model.searchForUsers(username: "");
                          },
                          child: Icon(Icons.clear),
                        )
                        : Icon(Icons.search),
              ),
            ),
            // SpaceWidth_L,
            // InkWell(
            //     onTap: () {
            //       showModalBottomSheet(
            //         context: context,
            //         backgroundColor: Colors.white,
            //         isScrollControlled: true,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(13),
            //             topRight: Radius.circular(13),
            //           ),
            //         ),
            //         builder: (ctx) => DraggableScrollableSheet(
            //           maxChildSize: 0.95,
            //           initialChildSize: 0.95,
            //           builder: (ctx, scrollController) => SearchFilterScreen(
            //             onSearch: (v) {
            //               // model.onFilter(searchModel: v);
            //             },
            //           ),
            //         ),
            //       );
            //     },
            //     child: Icon(Icons.filter_list_alt,
            //         size: 30, color: ThemeColors.primary)),
          ],
        ),
      ),
    );
  }
}
