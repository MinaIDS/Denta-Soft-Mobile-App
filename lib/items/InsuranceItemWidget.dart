import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../models/InsuranceModel.dart';
import '../screens/ThemeColors.dart';
import '../utils/SizesStatic.dart';

class InsuranceItemWidget extends StatelessWidget {
  final InsuranceModel insuranceModel;
  final Function onDelete;
  final Function onUpdate;

  const InsuranceItemWidget({
    super.key,
    required this.insuranceModel,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeWidth_L,
        vertical: SizeWidth_XS,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeWidth_M,
                vertical: SizeWidth_XS,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    insuranceModel.medicalCompany!,
                    style: TextStyle(
                      fontSize: SizeHeight_M,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => onUpdate(),
                  child: Text(
                    S().Edit,
                    style: TextStyle(color: ThemeColors.warning),
                  ),
                ),
                !insuranceModel.isDefault!
                    ? TextButton(
                        onPressed: () => onDelete(),
                        child: Text(
                          S().delete,
                          style: TextStyle(color: ThemeColors.danger),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
