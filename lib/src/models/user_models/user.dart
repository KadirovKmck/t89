import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserModel with ChangeNotifier {
  String _name = '';
  File? _photoProfile;

  String get name => _name;
  File? get photoProfile => _photoProfile;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _photoProfile = File(image.path);
      notifyListeners();
    }
  }
  
}
