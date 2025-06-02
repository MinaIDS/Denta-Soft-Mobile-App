import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyScreenWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final String? assetPath;

  EmptyScreenWidget({this.width, this.height, this.margin, this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              assetPath!,
              height: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.fill,
              repeat: false,
            ),
            SpaceHeight_XS,
            Text(S().NoDataAvailable),
          ],
        ),
      ),
    );
  }
}
