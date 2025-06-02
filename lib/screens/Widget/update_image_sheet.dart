import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImageSheet extends StatefulWidget {
  final ValueSetter<File> onSave;

  const UpdateImageSheet({required this.onSave});

  @override
  _UpdateImageSheetState createState() => _UpdateImageSheetState();
}

class _UpdateImageSheetState extends State<UpdateImageSheet> {
  File? _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 2,
          width: 30,
          decoration: BoxDecoration(color: Colors.grey),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: _imageFile == null ? _buildChooseimage() : _buildViewImage(),
        ),
      ],
    );
  }

  _buildViewImage() {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
            image: DecorationImage(image: FileImage(_imageFile!)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _imageFile = null;
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                minimumSize: Size(80, 35),
              ),
              child: Text('Remove'),
            ),
            SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onSave(_imageFile!);
              },
              style: ElevatedButton.styleFrom(minimumSize: Size(80, 35)),
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }

  _buildChooseimage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: () {
            _pickImage(ImageSource.gallery);
          },
          icon: Icon(Icons.image),
          label: Text('From Gallery'),
        ),
        TextButton.icon(
          onPressed: () {
            _pickImage(ImageSource.camera);
          },
          icon: Icon(Icons.camera_alt),
          label: Text('From Camera'),
        ),
      ],
    );
  }

  void _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      if (pickedFile == null) {
        return;
      }
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
