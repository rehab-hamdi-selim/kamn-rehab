import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
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
