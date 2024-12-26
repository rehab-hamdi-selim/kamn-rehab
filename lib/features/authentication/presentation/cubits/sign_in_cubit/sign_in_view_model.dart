import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
  }
}
enum SignInMethods{
    emailAndPassword,
    google,
   
  }
