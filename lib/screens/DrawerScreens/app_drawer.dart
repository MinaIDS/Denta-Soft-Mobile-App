import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/DrawerScreens/ChangeLanguage.dart';
import 'package:denta_soft/utils/localization/Localizations.dart';
import 'package:denta_soft/utils/localization/app_language.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/GlobalData.dart';
import '../../utils/GoTo.dart';
import '../../utils/SharedPrafrance/SharedPrafranceManager.dart';
import '../../utils/SizesStatic.dart';
import '../../utils/api_routes.dart';
import '../AccountScreens/login_screen.dart';
import '../app_theme.dart';
import '../home_index.dart';
import 'UsersScreens/UsersScreen.dart';
import 'feedback_screen.dart';
import 'help_screen.dart';
import 'insurance_screen.dart';
import 'invite_friend_screen.dart';
import 'treatment_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AppLanguage lang = Provider.of<AppLanguage>(context, listen: true);

    return Drawer(
      child: Container(
        color: AppTheme.notWhite.withOpacity(0.5),
        child: Column(
          children: [
            buildDrawerHeader(),
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    title: S().Home,
                    icon: 'home',
                    onTab: () {
                      GoTo.replaceScreen(context, HomeIndex());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().Insurance,
                    icon: 'insurance',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, InsuranceScreen());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().Treatment,
                    icon: 'treatment',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, TreatmentScreen());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().Users,
                    icon: 'help',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, UsersScreen());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().Help,
                    icon: 'help',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, HelpScreen());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().FeedBack,
                    icon: 'rate',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, FeedbackScreen());
                    },
                  ),
                  _buildDrawerItem(
                    title: S().InviteFreind,
                    icon: 'invite',
                    onTab: () {
                      Navigator.of(context).pop();
                      GoTo.screen(context, InviteFriend());
                    },
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: AppTheme.grey.withOpacity(0.6)),
            InkWell(
              onTap: () {
                GoTo.screen(context, ChangeLanguageScreen());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Text(
                  AppLocalizations.of(
                    context,
                  )!.translate(lang.appLocal.languageCode.toString()),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            Divider(height: 1, color: AppTheme.grey.withOpacity(0.6)),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppTheme.darkText,
                ),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(Icons.logout_outlined, color: Colors.red),
              onTap: () async {
                await SharedPrafranceManager().deleteAllDataStorage();
                GoTo.screenAndRemoveUntil(context, LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String title,
    required String icon,
    required Function onTab,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTab(),
          splashColor: Colors.grey.withOpacity(0.1),
          highlightColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/images/$icon.png'),
                  size: 22,
                  color: Colors.blueGrey[800],
                ),
                SizedBox(width: 25),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DrawerHeader buildDrawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 3,
                  color: Colors.grey[350]!,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
              child: GlobalData.accountData!.objectData.photoJson == null
                  ? Image.asset(
                      'assets/images/place_holder.jpg',
                      color: Colors.grey,
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          ApiRoutes.userImagePath +
                          (GlobalData.accountData!.objectData.photoJson ?? ''),
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
          SpaceWidth_L,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                GlobalData.accountData!.objectData.userName ?? 'Unknown User',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
              SpaceHeight_XXS,
              Text(
                GlobalData.accountData!.objectData.clinicName ??
                    'Unknown Clinic',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
