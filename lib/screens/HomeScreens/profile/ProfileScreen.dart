import 'package:denta_soft/controllers/AccountController.dart';
import 'package:denta_soft/generated/l10n.dart' as S;
import 'package:denta_soft/services/AccountServices.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/GlobalData.dart';
import '../../../utils/GoTo.dart';
import '../../../utils/api_routes.dart';
import '../../../utils/localization/Localizations.dart';
import '../../Widget/update_image_sheet.dart';
import 'change_password.dart';
import 'edit_profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoadingImage = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await AccountServices().getUserData(
          GlobalData.accountData!.objectData.userId ?? '',
        );
        setState(() {});
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, kToolbarHeight, 20, 10),
            child: ListView(
              children: [
                _buildHeader(),
                Divider(height: 40, thickness: 2),
                _buildBody(),
              ],
            ),
          ),
          PositionedDirectional(
            top: kToolbarHeight,
            end: 10,
            child: PopupMenuButton(
              icon: Icon(Icons.edit),
              padding: EdgeInsets.zero,
              iconSize: 20,
              onSelected: (v) {
                if (v == 1) {
                  GoTo.screen(
                    context,
                    EditProfileInfo(),
                  ).then((_) => setState(() {}));
                } else {
                  GoTo.screen(context, ChangePassword());
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 1, child: Text(S.S().Edit_info)),
                PopupMenuItem(value: 2, child: Text(S.S().ChangePassword)),
              ],
            ),
          ),
        ],
      ),
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
                    child: GlobalData.accountData!.objectData.photoJson == null
                        ? Container()
                        : CachedNetworkImage(
                            imageUrl:
                                ApiRoutes.userImagePath +
                                (GlobalData.accountData!.objectData.photoJson ??
                                    ''),
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
                  GlobalData.accountData!.objectData.fullName ?? '',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3),
                Text(GlobalData.accountData!.objectData.clinicName ?? ''),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        infoItem(Icons.phone, GlobalData.accountData!.objectData.mobile ?? ''),
        SizedBox(height: 8),
        infoItem(
          Icons.mail,
          GlobalData.accountData!.objectData.emailAddress ?? '',
        ),
      ],
    );
  }

  void _changeProfileImage(image) async {
    final userData = GlobalData.accountData!.objectData;
    setState(() {
      isLoadingImage = true;
    });

    await AccountController().updateProfileImage(userData.userId!, image, true);
    setState(() {
      isLoadingImage = false;
    });
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
          bodyRow(
            '${S.S().UserName}:',
            GlobalData.accountData!.objectData.userName ?? '',
          ),
          bodyRow(
            '${S.S().Country}:',
            AppLocalizations.of(
              context,
            )!.translate(GlobalData.accountData!.objectData.countryId ?? ''),
          ),
          bodyRow(
            '${S.S().City}:',
            AppLocalizations.of(
              context,
            )!.translate(GlobalData.accountData!.objectData.cityId ?? ''),
          ),
          bodyRow(
            '${S.S().Address}:',
            GlobalData.accountData!.objectData.address ?? '',
          ),
          bodyRow(
            '${S.S().Title}:',
            GlobalData.accountData!.objectData.title ?? '',
          ),
          bodyRow(
            '${S.S().BranchName}:',
            GlobalData.accountData!.objectData.branchName ?? '',
          ),
          bodyRow(
            'Role Id:',
            AppLocalizations.of(
              context,
            )!.translate(GlobalData.accountData!.objectData.userRole ?? ''),
          ),
          bodyRow(
            '${S.S().CalendarView}:',
            GlobalData.accountData!.objectData.calendarView ?? "",
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
