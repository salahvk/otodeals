import 'dart:io';

import 'package:flutter/material.dart';
class FilePathProvider extends ChangeNotifier {
  File? filePath;


  void setFilePath(File? path) {
    filePath = path;
    notifyListeners();
  }
}
