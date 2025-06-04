// ignore_for_file: unused_local_variable, duplicate_ignore

import 'dart:io';
import 'dart:async';

import 'package:denta_soft/controllers/AttachmentsController.dart';
import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/models/PatientModel.dart';
import 'package:denta_soft/screens/ImageViewerScreen.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:denta_soft/utils/GoTo.dart';
import 'package:denta_soft/utils/SizeandStyleUtills.dart';

import 'package:denta_soft/utils/api_routes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Import new packages for image picking and compression
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart'; // Image picker

class ImageIntraoraolScreen extends StatefulWidget {
  final PatientModel patient;
  final AttachmentsController model;

  const ImageIntraoraolScreen({
    super.key,
    required this.patient,
    required this.model,
  });

  @override
  _ImageIntraoraolScreenState createState() => _ImageIntraoraolScreenState();
}

class _ImageIntraoraolScreenState extends State<ImageIntraoraolScreen> {
  List<XFile> images = <XFile>[]; // Using ImagePicker's XFile
  List<File> imagesMini = <File>[];
  List<String> imagesL = <String>[];

  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SizeandStyleUtills().screenWidth * 0.9,
            child: ElevatedButton(
              onPressed: loadAssets,
              child: Text(S().Pick_images),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 15),
            widget.model.isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox(),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: List.generate(
                widget.model.attachmentsIntraoral.length,
                (index) {
                  var img = widget.model.attachmentsIntraoral[index];
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          GoTo.screen(
                            context,
                            ImageViewerScreen(
                              sliderImages: [img],
                              selectedImage: 0,
                            ),
                          );
                        },
                        child: CachedNetworkImage(
                          imageUrl:
                              ApiRoutes.patientImagePath +
                              img.attachmentThumbnail,
                          fit: BoxFit.cover,
                          height: 300,
                          width: SizeandStyleUtills().screenWidth * 0.29,
                          placeholder: (context, url) => Container(
                            padding: EdgeInsets.all(15),
                            child: Image.asset('assets/images/loading.gif'),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, size: 35, color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            print('delete');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.question,
                              animType: AnimType.bottomSlide,
                              title: "",
                              desc: 'Are you sure you want to delete?',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () async {
                                widget.model.deleteAttachments(model: img);
                              },
                            ).show();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            buildGridView(),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(imagesMini.length, (index) {
        File asset = imagesMini[index];
        return Padding(
          padding: EdgeInsets.all(2),
          child: Image.file(asset, width: 300, height: 300),
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<XFile> resultList = <XFile>[]; // Using XFile instead of Asset
    String error = 'No Error Detected';

    try {
      final pickedFiles = await _picker
          .pickMultiImage(); // Use pickMultiImage for multiple images
      resultList = pickedFiles;
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });

    print('Selected images count: ${images.length}');
    images.forEach((imageFile) async {
      final filePath = imageFile.path;
      imagesL.add(filePath); // Store file paths
      compressImage(filePath);
    });

    await Future.delayed(Duration(seconds: 3));
    // ignore: unused_local_variable
    List<Map<String, dynamic>> finalBody = [];
    FormData formData = FormData();

    for (int i = 0; i < imagesL.length; i++) {
      formData.files.addAll({
        MapEntry(
          'patientAttachmentViewModels[$i].AttachmentFile',
          await MultipartFile.fromFile(imagesL[i], filename: 'file$i.png'),
        ),
        MapEntry(
          'patientAttachmentViewModels[$i].AttachmentFileThumb',
          await MultipartFile.fromFile(
            imagesMini[i].path,
            filename: 'file$i.png',
          ),
        ),
      });
      formData.fields.addAll({
        MapEntry(
          'patientAttachmentViewModels[$i].CreateUserId',
          GlobalData.accountData!.objectData.userId!,
        ),
        MapEntry(
          'patientAttachmentViewModels[$i].PatientId',
          widget.patient.patientId!,
        ),
        MapEntry('patientAttachmentViewModels[$i].Comments', ""),
        MapEntry("patientAttachmentViewModels[$i].AttachmentType", "Intraoral"),
      });
    }

    await widget.model.saveAttachmentsProfile(
      context,
      formData,
      widget.patient.patientId!,
    );
  }

  void compressImage(String filePath) async {
    // Use image package to compress and resize
    var image = img.decodeImage(await File(filePath).readAsBytes());

    if (image != null) {
      var resizedImage = img.copyResize(image, width: 400); // Resize image
      var compressedImage = File(filePath)
        ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 50));

      setState(() {
        imagesMini.add(compressedImage);
      });

      print('Compressed image added: ${imagesMini.length}');
    }
  }
}
