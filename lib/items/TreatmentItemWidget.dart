import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../models/TreatmentModel.dart';
import '../screens/ThemeColors.dart';
import '../utils/SizesStatic.dart';

class TreatmentItemWidget extends StatelessWidget {
  final TreatmentModel treatmentModel;
  final Function onAddProcedure;
  final Function onProcedureList;
  final Function onUpdate;
  final bool isActive;

  // Marking parameters as required for null safety
  const TreatmentItemWidget({
    super.key,
    required this.treatmentModel,
    required this.onAddProcedure,
    required this.onUpdate,
    required this.isActive,
    required this.onProcedureList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeWidth_L,
        vertical: SizeWidth_S,
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
                          treatmentModel.treatmentName!,
                          style: TextStyle(
                            fontSize: SizeHeight_L,
                            fontWeight: FontWeight.w600,
                            color: ThemeColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Conditionally render Enable/Disable button
                !isActive
                    ? InkWell(
                        onTap: () => onUpdate(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            child: Text(
                              S().Enable,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () => onUpdate(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ThemeColors.danger,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            child: Text(
                              S().Disable,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 10),
            // If active, display procedure list and add procedure buttons
            !isActive
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () => onProcedureList(),
                        child: Text(
                          S().ProcedureList,
                          style: TextStyle(color: ThemeColors.nearlyBlack),
                        ),
                      ),
                      SpaceWidth_S,
                      OutlinedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        onPressed: () => onAddProcedure(),
                        child: Text(
                          S().AddProcedure,
                          style: TextStyle(color: ThemeColors.nearlyBlack),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
