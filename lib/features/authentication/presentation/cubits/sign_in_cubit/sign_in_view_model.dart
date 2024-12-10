import 'package:flutter/material.dart';

class SignInViewModel {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
  }
}
