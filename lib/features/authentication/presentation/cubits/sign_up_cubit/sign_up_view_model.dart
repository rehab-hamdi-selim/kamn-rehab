import 'package:flutter/material.dart';

class SignUpViewModel {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    nameController?.dispose();
    confirmPasswordController?.dispose();
  }
}
