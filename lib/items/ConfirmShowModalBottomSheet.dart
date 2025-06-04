import 'package:denta_soft/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../utils/SizeandStyleUtills.dart';
import '../utils/SizesStatic.dart';

class ShowModalSheetConfirmation extends StatefulWidget {
  final String? mainTitle;
  final String title;
  final Function onTapFunction;

  const ShowModalSheetConfirmation({
    super.key,
    required this.title,
    this.mainTitle,
    required this.onTapFunction,
  });

  @override
  _ShowModalSheetConfirmationState createState() =>
      _ShowModalSheetConfirmationState();
}

class _ShowModalSheetConfirmationState
    extends State<ShowModalSheetConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          SpaceHeight_XL,
          Center(
            child: Text(
              S().Confirm,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SpaceHeight_XL,
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              ' ${widget.mainTitle} ' + widget.title + " ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          SpaceHeight_XXXL,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: widget.onTapFunction as void Function()?,
                child: Container(
                  width: SizeandStyleUtills().getProportionalWidth(width: 150),
                  height: SizeandStyleUtills().getProportionalHeight(
                    height: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      S().Confirm,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SpaceWidth_L,
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: SizeandStyleUtills().getProportionalWidth(width: 150),
                  height: SizeandStyleUtills().getProportionalHeight(
                    height: 50,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      S().Cancel,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
