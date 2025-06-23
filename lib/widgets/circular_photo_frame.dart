import 'dart:io';
import 'package:flutter/material.dart';

class CircularPhotoFrame extends StatelessWidget {
  final File? file;

  const CircularPhotoFrame({this.file});

  factory CircularPhotoFrame.placeholder() {
    return CircularPhotoFrame();
  }

  factory CircularPhotoFrame.fromFile(File file) {
    return CircularPhotoFrame(file: file);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.grey[300],
      backgroundImage: file != null ? FileImage(file!) : null,
      child: file == null
          ? Icon(
              Icons.camera_alt,
              size: 40,
              color: Colors.black45,
            )
          : null,
    );
  }
}