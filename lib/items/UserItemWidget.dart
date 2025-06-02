import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/AccountModel.dart';
import 'package:denta_soft/screens/DrawerScreens/UsersScreens/UserProfileScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/ThemeColors.dart';
import '../utils/GoTo.dart';
import '../utils/SizesStatic.dart';
import '../utils/api_routes.dart';

class UserItemWidget extends StatelessWidget {
  final ObjectData?
  userModel; // Make userModel nullable with ? as it can be null.

  UserItemWidget({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (userModel == null) {
      // Handle the case where userModel is null to prevent any runtime errors.
      return SizedBox.shrink();
    }

    return InkWell(
      onTap: () {
        GoTo.screen(context, UserProfileScreen(userData: userModel!));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeWidth_XXS,
          vertical: SizeWidth_XS,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            userModel!.photoJson == null
                ? Container(
                  child: Text(
                    userModel!.userName![0].toString(),
                    style: TextStyle(
                      fontSize: SizeHeight_XXXL,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                )
                : CachedNetworkImage(
                  height: 100,
                  width: 100,
                  imageUrl: ApiRoutes.userImagePath + userModel!.photoJson!,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(15),
                        child: Image.asset('assets/images/loading.gif'),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: Icon(Icons.error, size: 35, color: Colors.grey),
                      ),
                ),
            Container(height: 80, width: 1, color: Colors.grey[200]),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeWidth_XXS,
                  vertical: SizeWidth_XS,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            userModel!.fullName!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SpaceWidth_S,
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            color: ThemeColors.primary,
                          ),
                          onPressed: () {
                            // You can uncomment the code if needed later
                            // GoTo.screen(
                            //   context,
                            //   PatientDetailsScreen(
                            //       patientModel: patientModel),
                            // );
                          },
                        ),
                      ],
                    ),
                    userModel!.phoneWork == null
                        ? Container()
                        : Text(
                          S().PhoneNumber + ": " + (userModel!.mobile ?? ""),
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        ),
                    SpaceHeight_XS,
                    userModel!.emailAddress == null
                        ? Container()
                        : Text(
                          S().Email + ": " + (userModel!.emailAddress ?? ""),
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        ),
                    SpaceHeight_XS,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
