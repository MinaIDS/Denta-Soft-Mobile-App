import 'package:denta_soft/controllers/AccountController.dart';
import 'package:denta_soft/controllers/UsersScreenController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/AccountModel.dart';
import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/utils/ToastM.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/GoTo.dart';
import '../../../utils/api_routes.dart';
import '../../../utils/localization/Localizations.dart';
import '../../Widget/update_image_sheet.dart';
import 'EditUserProfileInfo.dart';

class UserProfileScreen extends StatefulWidget {
  final ObjectData? userData; // Make userData nullable

  const UserProfileScreen({super.key, this.userData});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isLoadingImage = false;
  late UsersScreenController model; // Make sure model is non-nullable

  @override
  Widget build(BuildContext context) {
    model = Provider.of<UsersScreenController>(context, listen: false);
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, kToolbarHeight, 20, 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildHeader(),
                Divider(height: 40, thickness: 2),
                _buildBody(),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: kToolbarHeight,
          end: 10,
          child: PopupMenuButton<int>(
            icon: Icon(Icons.edit),
            padding: EdgeInsets.zero,
            iconSize: 20,
            onSelected: (v) async {
              if (v == 1) {
                GoTo.screen(
                  context,
                  EditUserProfileInfo(userData: widget.userData!),
                ).then((_) => setState(() {}));
              } else {
                bool status = await AccountController().forgetPassword(
                  widget.userData?.emailAddress ?? '',
                );
                if (status) {
                  ToastM.show(
                    S().newpasswordsenttoemailwithnewpasswordsuccessfully,
                  );
                }
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 1, child: Text(S().Edit_info)),
              PopupMenuItem(value: 2, child: Text(S().ChangePassword)),
            ],
          ),
        ),
      ],
    );
  }

  _buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    border: Border.all(color: Colors.grey[300]!),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 3,
                        color: Colors.grey[200]!,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    child: widget.userData?.photoJson == null
                        ? Container()
                        : CachedNetworkImage(
                            imageUrl:
                                ApiRoutes.userImagePath +
                                (widget.userData?.photoJson ?? ''),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              padding: EdgeInsets.all(15),
                              child: Image.asset('assets/images/loading.gif'),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, size: 35, color: Colors.grey),
                          ),
                  ),
                ),
                PositionedDirectional(
                  end: -5,
                  bottom: -5,
                  child: GestureDetector(
                    onTap: isLoadingImage
                        ? null
                        : () {
                            showSheet(
                              UpdateImageSheet(onSave: _changeProfileImage),
                            );
                          },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey[300],
                      child: isLoadingImage
                          ? SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Icon(
                              Icons.camera_alt_outlined,
                              size: 17,
                              color: Colors.blue,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.userData?.fullName ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                infoItemWithoutIcon(widget.userData?.mobile ?? ''),
                SizedBox(height: 3),
                Text(widget.userData?.clinicName ?? ''),
              ],
            ),
          ],
        ),
        SizedBox(height: 18),
        infoItem(Icons.mail, widget.userData?.emailAddress ?? ''),
      ],
    );
  }

  void _changeProfileImage(image) async {
    final userData = widget.userData;
    setState(() {
      isLoadingImage = true;
    });

    if (userData != null) {
      await AccountController().updateProfileImage(
        userData.userId!,
        image,
        false,
      );
      await model.searchForUsers(username: "");
      final newImageData = model.usersList.firstWhere(
        (element) => element.userId == userData.userId,
      );
      setState(() {
        widget.userData!.photoJson = newImageData.photoJson;
      });
    }

    setState(() {
      isLoadingImage = false;
    });
  }

  Row infoItemWithoutIcon(String title) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }

  Row infoItem(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        SizedBox(width: 15),
        Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  showSheet(Widget child) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      context: context,
      builder: (context) => child,
    );
  }

  _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          bodyRow('${S().UserName}:', widget.userData?.userName ?? ''),
          bodyRow(
            '${S().Country}:',
            AppLocalizations.of(
              context,
            )!.translate(widget.userData?.countryId ?? ''),
          ),
          bodyRow(
            '${S().City}:',
            AppLocalizations.of(
              context,
            )!.translate(widget.userData?.cityId ?? ''),
          ),
          bodyRow('${S().Address}:', widget.userData?.address ?? ''),
          if ((widget.userData?.title?.isNotEmpty ?? false))
            bodyRow(
              '${S().Title}:',
              AppLocalizations.of(
                context,
              )!.translate(widget.userData?.title ?? ''),
            ),
          bodyRow('${S().BranchName}:', widget.userData?.branchName ?? ''),
          bodyRow(
            'Role Id:',
            AppLocalizations.of(
              context,
            )!.translate(widget.userData?.userRole ?? ''),
          ),
          bodyRow('${S().CalendarView}:', widget.userData?.calendarView ?? ''),
          SizedBox(height: 20),
          InkWell(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ThemeColors.warning,
              ),
              child: Text(
                S().ResetPassword.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.bottomSlide,
                title: "",
                desc: S().youwanttoresetuserpasswordbyemail,
                btnCancelOnPress: () {},
                btnOkOnPress: () async {
                  bool status = await AccountController().forgetPassword(
                    widget.userData?.emailAddress ?? '',
                  );
                  if (status) {
                    // ToastM.show("Account Deleted.");
                    // await model.searchForUsers(username: "");
                    // Navigator.of(context).pop();
                  }
                },
              ).show();
            },
          ),
          SizedBox(height: 20),
          InkWell(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ThemeColors.danger,
              ),
              child: Text(
                S().DeleteUser.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () async {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.question,
                animType: AnimType.bottomSlide,
                title: "",
                desc: S().Areyousureyouwanttodelete,
                btnCancelOnPress: () {},
                btnOkOnPress: () async {
                  bool status = await UsersScreenController().deleteUser([
                    widget.userData?.userId ?? '',
                  ]);
                  if (status) {
                    ToastM.show(S().AccountDeleted);
                    await model.searchForUsers(username: "");
                    Navigator.of(context).pop();
                  }
                },
              ).show();
            },
          ),
        ],
      ),
    );
  }

  Container bodyRow(String title, String subtitle) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(child: Text(subtitle)),
          ],
        ),
      ),
    );
  }
}
