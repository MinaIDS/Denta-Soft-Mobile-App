import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/add_patient/patient_medical_history.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/buttons/accent_button.dart';
import '../../../../widgets/buttons/text_button.dart';
import '../../../Widget/custom_appBar.dart';
import '../../../Widget/shared/base_widget.dart';
import 'add_patient_viewModel.dart';
import 'patient_details.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppBar(title: 'Add new patient'),
      body: BaseWidget<AddPatientViewModel>(
        model: AddPatientViewModel(),
        initState: (m) {
          m.getMedicalInsurances();
          m.getDieasesList();
        },
        builder: (context, model, local, _) => Column(
          children: [
            _buildIndicator(model),
            _buildbody(model),
            _buildFooter(model, context),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(AddPatientViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DotsIndicator(
        dotsCount: 2,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        position: model.currentPage.toDouble(),
        decorator: DotsDecorator(
          size: Size.fromRadius(5),
          activeSize: Size.fromRadius(7),
          color: Colors.grey[500]!, // Inactive color
          activeColor: const Color(0xfff5be28),
        ),
        //   ),
      ),
    );
  }

  _buildbody(AddPatientViewModel model) {
    return Expanded(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        pageSnapping: true,
        controller: model.pageController,
        onPageChanged: (value) {
          model.changePage(value);
        },
        children: [PatientDetails(model), PatientMedicalHistory(model)],
      ),
    );
  }

  _buildFooter(AddPatientViewModel model, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: model.currentPage == 0
          ? Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: CustomTextButton(
                text: S().Next,
                textColor: Colors.orange,
                onPressed: () {
                  if (model.patientDetailsKey.currentState!.validate()) {
                    model.pageController.animateToPage(
                      model.currentPage + 1,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextButton(
                    text: S().Previous,
                    textColor: Colors.orange,
                    onPressed: () {
                      model.pageController.animateToPage(
                        model.currentPage - 1,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: model.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : AccentButton(
                          text: S().AddPatient,
                          height: 40,
                          width: 150,
                          onPressed: () {
                            model.addPatient(context);
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
