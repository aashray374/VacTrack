import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageServices{
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}