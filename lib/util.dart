import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Util {
  static showError(String error) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(error)));
  }
}
