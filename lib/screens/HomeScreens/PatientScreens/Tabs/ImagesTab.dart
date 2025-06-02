import 'package:image/image.dart' as img; // Import the image package
import 'package:image_picker/image_picker.dart'; // For picking images
import 'package:denta_soft/controllers/AttachmentsController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/ImagesType/ImageExtraoralScreen.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/ImagesType/ImageIntraoraolScreen.dart';
import 'package:denta_soft/screens/HomeScreens/PatientScreens/Tabs/ImagesType/ImageXrayScreen.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';
import 'package:denta_soft/utils/SizesStatic.dart';
import 'package:denta_soft/widgets/OnceFutureBuilder.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class ImagesTab extends StatefulWidget {
  final PatientModel? patient;

  const ImagesTab({Key? key, this.patient}) : super(key: key);

  @override
  _ImagesTabState createState() => _ImagesTabState();
}

class _ImagesTabState extends State<ImagesTab> {
  List<File> images = []; // Store images as File objects
  String _error = 'No Error Dectected';

  final picker = ImagePicker(); // ImagePicker instance for image selection

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ChangeNotifierProvider.value(
        value: AttachmentsController(),
        child: Consumer<AttachmentsController>(
          builder:
              (context, model, child) => RefreshIndicator(
                onRefresh: () async {
                  await model.getAttachments(
                    patientId: widget.patient!.patientId,
                  );
                },
                child: OnceFutureBuilder(
                  future:
                      () => model.getAttachments(
                        patientId: widget.patient!.patientId,
                      ),
                  builder: (ctx, snapShot) {
                    if (snapShot.connectionState != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Scaffold(
                      backgroundColor: Colors.white,
                      body: Column(
                        children: <Widget>[
                          // create widgets for each tab bar here
                          TabBar(
                            labelColor: Colors.blue,
                            tabs: [
                              Container(
                                width: SizeandStyleUtills().screenWidth * 0.29,
                                child: Tab(text: S().XRay),
                              ),
                              Container(
                                width: SizeandStyleUtills().screenWidth * 0.29,
                                child: Tab(text: S().Intraoral),
                              ),
                              Container(
                                width: SizeandStyleUtills().screenWidth * 0.29,
                                child: Tab(text: S().Extraoral),
                              ),
                            ],
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            isScrollable: true,
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ImageXrayScreen(
                                  patient: widget.patient!,
                                  model: model,
                                ),
                                ImageIntraoraolScreen(
                                  patient: widget.patient!,
                                  model: model,
                                ),
                                ImageExtraoralScreen(
                                  patient: widget.patient,
                                  model: model,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
        ),
      ),
    );
  }

  // Function to pick multiple images using the ImagePicker
  Future<void> loadAssets() async {
    try {
      // Pick images using the image_picker package
      final pickedFiles = await picker.pickMultiImage();

      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        List<File> selectedFiles = [];

        // Load and manipulate images if necessary (e.g., resizing)
        for (var pickedFile in pickedFiles) {
          File file = File(pickedFile.path);

          // Load the image using the image package
          img.Image? image = img.decodeImage(file.readAsBytesSync());

          if (image != null) {
            // Perform any image manipulation you need
            // For example, resizing the image:
            img.Image resized = img.copyResize(image, width: 600);

            // Save the manipulated image back to the file system (if needed)
            final resizedFile = await file.writeAsBytes(img.encodeJpg(resized));

            selectedFiles.add(resizedFile);
          }
        }

        setState(() {
          images =
              selectedFiles; // Update the image list with manipulated files
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  Widget buildImageCompouant({String? title, Function? ontap}) {
    return GestureDetector(
      onTap: () => ontap!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Container(
          width: SizeandStyleUtills().getProportionalWidth(width: 450),
          margin: EdgeInsets.symmetric(
            vertical: SizeHeight_S,
            horizontal: SizeWidth_XXS,
          ),
          padding: EdgeInsets.symmetric(
            vertical: SizeHeight_S,
            horizontal: SizeWidth_S,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title!, style: TextStyle(color: Colors.blue, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }

  // GridView to display the picked images
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        return Image.file(
          images[index],
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        );
      }),
    );
  }
}
