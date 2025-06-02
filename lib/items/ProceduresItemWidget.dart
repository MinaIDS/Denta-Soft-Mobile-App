import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../models/ProcedureModel.dart';
import '../screens/ThemeColors.dart';
import '../utils/SizesStatic.dart';

class ProceduresItemWidget extends StatelessWidget {
  final ProcedureModel procedureModel;
  final Function onDelete;
  final Function onUpdate;

  // Marking the parameters as required to avoid null issues.
  const ProceduresItemWidget({
    Key? key,
    required this.procedureModel,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

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
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeWidth_M,
                      vertical: SizeWidth_XS,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          procedureModel.procedureName ??
                              'No Procedure Name', // Default text in case it's null
                          style: TextStyle(
                            fontSize: SizeHeight_L,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => onDelete(),
                  child: Icon(Icons.close, color: ThemeColors.danger, size: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  onPressed: () => onDelete(),
                  child: Text(
                    S().PriceList,
                    style: TextStyle(color: ThemeColors.nearlyBlack),
                  ),
                ),
                SpaceWidth_S,
                TextButton(
                  onPressed: () => onUpdate(),
                  style: TextButton.styleFrom(
                    backgroundColor: ThemeColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(S().Edit, style: ThemeColors.btnText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
