import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../models/PatientModel.dart';
import '../screens/HomeScreens/PatientScreens/PatientDetailsScreen.dart';
import '../screens/ThemeColors.dart';
import '../utils/GoTo.dart';
import '../utils/SizesStatic.dart';
import '../utils/api_routes.dart';

class PatientItemWidget extends StatelessWidget {
  final PatientModel patientModel;

  // Making patientModel required
  const PatientItemWidget({Key? key, required this.patientModel})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("ppId:${patientModel.patientId}");
        GoTo.screen(context, PatientDetailsScreen(patientModel: patientModel));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeWidth_XXS,
          vertical: SizeWidth_XS,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            patientModel.photoJson == null
                ? Container(
                  child: Text(
                    patientModel.patientName!.isNotEmpty
                        ? patientModel.patientName![0].toString()
                        : 'N/A',
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
                : ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    ApiRoutes.server_url + patientModel.photoJson!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
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
                            patientModel.patientName!,
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
                            GoTo.screen(
                              context,
                              PatientDetailsScreen(patientModel: patientModel),
                            );
                          },
                        ),
                      ],
                    ),
                    patientModel.occupation?.isEmpty ?? true
                        ? Container()
                        : Text(
                          patientModel.occupation ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                    patientModel.occupation?.isEmpty ?? true
                        ? Container()
                        : SpaceHeight_XS,
                    patientModel.phoneWork?.isEmpty ?? true
                        ? Container()
                        : Text(
                          "${S().PhoneNumber}: " +
                              (patientModel.phoneWork ?? ""),
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        ),
                    SpaceHeight_XS,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${S().Gender}: " + (patientModel.gender ?? 'N/A'),
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        ),
                        SpaceWidth_L,
                        Text(
                          "${S().Age}: " +
                              (patientModel.age?.toString() ?? 'N/A'),
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        ),
                      ],
                    ),
                    SpaceHeight_XS,
                    patientModel.lastVisit?.isEmpty ?? true
                        ? Text(
                          "${S().LastVisit}: xx:xx:xx",
                          style: TextStyle(color: Color(0xffCBCBCB)),
                        )
                        : Text(
                          "${S().LastVisit}: " +
                              (patientModel.lastVisit ?? "N/A"),
                        ),
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
