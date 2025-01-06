import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var loginKey = GlobalKey<FormState>();

  var onclick = true.obs;

  var email = '';
  var pass = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
}
