import 'package:denta_soft/screens/home_index.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/localization/Localizations.dart';
import 'package:denta_soft/utils/localization/app_language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LanguageSite { en, ar, fr }

class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using Provider to get the current language model
    AppLanguage model = Provider.of<AppLanguage>(context, listen: true);

    return WillPopScope(
      onWillPop: () async {
        GoTo.screenAndRemoveUntil(context, HomeIndex());
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(
              context,
            )!.translate(model.appLocal.languageCode ?? 'en'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _buildLanguageOption(context, 'English', LanguageSite.en, model),
              SizedBox(height: 12),
              _buildLanguageOption(
                context,
                'اللغة العربية',
                LanguageSite.ar,
                model,
              ),
              SizedBox(height: SizeandStyleUtills().screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    String languageName,
    LanguageSite languageSite,
    AppLanguage model,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      alignment: Alignment.center,
      width: SizeandStyleUtills().screenWidth * 1,
      margin: EdgeInsets.symmetric(
        horizontal: SizeandStyleUtills().screenWidth * 0.1,
      ),
      child: RadioListTile<LanguageSite>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(languageName),
        value: languageSite,
        groupValue: model.language,
        onChanged: (LanguageSite? value) {
          if (value != null) {
            model.setLanguage(value);
            // Apply the new locale based on the selected language
            model.changeLanguage(Locale(value.toString().split('.').last));
          }
        },
      ),
    );
  }
}
