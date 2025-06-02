import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';

class CountryPicker extends StatelessWidget {
  final void Function(Country)? onValuePicked;

  CountryPicker({this.onValuePicked});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.pink),
      child: CountryPickerDialog(
        titlePadding: const EdgeInsets.all(8.0),
        searchCursorColor: Colors.pinkAccent,
        searchInputDecoration: InputDecoration(hintText: 'Search...'),
        isSearchable: true,
        title: Text('Select your country'),
        onValuePicked: onValuePicked!,
        itemBuilder: (country) {
          return Row(
            children: <Widget>[
              Flexible(child: CountryPickerUtils.getDefaultFlagImage(country)),
              SizedBox(width: 15),
              Flexible(child: Text(country.name))
            ],
          );
        },
        priorityList: [
          CountryPickerUtils.getCountryByIsoCode('EG'),
        ],
      ),
    );
  }
}
