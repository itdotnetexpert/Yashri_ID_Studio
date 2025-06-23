import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/circular_photo_frame.dart';
import 'preview_screen.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final roleController = TextEditingController();
  final numberController = TextEditingController();

  File? _pickedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        _pickedImage = File(picked.path);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _pickedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PreviewScreen(
            name: nameController.text,
            role: roleController.text,
            number: numberController.text,
            image: _pickedImage!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please complete the form and photo')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fill Card Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'नाम (Name in Hindi)'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: roleController,
                decoration: InputDecoration(labelText: 'दायित्व (Role)'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(labelText: 'क्रमांक (ID Number)'),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: _pickedImage == null
                      ? CircularPhotoFrame.placeholder()
                      : CircularPhotoFrame.fromFile(_pickedImage!),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text('Generate Card'),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}