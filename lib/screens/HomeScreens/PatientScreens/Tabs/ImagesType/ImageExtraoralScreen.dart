// ignore_for_file: unused_local_variable

import 'dart:io';
// for json encoding

import 'package:denta_soft/controllers/AttachmentsController.dart';

import 'package:denta_soft/models/PatientModel.dart';

import 'package:denta_soft/utils/GlobalData.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// Replacing `flutter_native_image` and `multi_image_picker2`
import 'package:image/image.dart' as img; // Image processing
import 'package:image_picker/image_picker.dart'; // Image picker

class ImageExtraoralScreen extends StatefulWidget {
  final PatientModel? patient;
  final AttachmentsController? model;

  const ImageExtraoralScreen({super.key, this.patient, this.model});

  @override
  _ImageExtraoralScreenState createState() => _ImageExtraoralScreenState();
}

class _ImageExtraoralScreenState extends State<ImageExtraoralScreen> {
  List<XFile> images = <XFile>[]; // Changed to store image picker files
  List<File> imagesMini = <File>[];
  List<String> imagesL = <String>[];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 15),
          widget.model!.isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox(),
          buildGridView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: ElevatedButton(
              onPressed: loadAssets,
              child: Text("Pick Images"),
            ),
          ),
        ],
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

  // Replace loadAssets method
  Future<void> loadAssets() async {
    List<XFile> resultList = <XFile>[];
    String error = 'No Error Detected';

    try {
      final pickedFiles = await _picker
          .pickMultiImage(); // Pick multiple images

      resultList = pickedFiles;
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });

    for (var imageFile in images) {
      compressImage(imageFile.path);
    }

    await uploadImages();
  }

  Future<void> uploadImages() async {
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
          widget.patient!.patientId!,
        ),
        MapEntry('patientAttachmentViewModels[$i].Comments', ""),
        MapEntry("patientAttachmentViewModels[$i].AttachmentType", "Extraoral"),
      });
    }

    await widget.model!.saveAttachmentsProfile(
      context,
      formData,
      widget.patient!.patientId!,
    );
  }

  // Replace compressImage method with image package for compression
  void compressImage(String filePath) async {
    // Load image
    var image = img.decodeImage(await File(filePath).readAsBytes());

    if (image != null) {
      // Resize and compress
      var resizedImage = img.copyResize(image, width: 400);
      var compressedImage = File(filePath)
        ..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 50));

      setState(() {
        imagesMini.add(compressedImage);
        imagesL.add(filePath); // Save original image path
      });
    }
  }
}
