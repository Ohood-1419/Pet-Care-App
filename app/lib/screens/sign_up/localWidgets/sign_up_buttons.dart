import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/screens/root.dart';
import 'package:app/widgets/rounded_elevated_button.dart';
import 'package:app/widgets/text_with_textbutton.dart';

import '../../../config.dart';
import '../verify.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    
    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
          ),
          SizedBox(height: Config.screenHeight! * 0.02),
          RoundedElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                String name = _nameController.text.trim();
                String email = _emailController.text.trim();
                String password = _passwordController.text;
                _authController.signUp(name, email, password);
                Get.to(VerifyScreen());

                await users.add(
                    {"username": name, "email": email, "password": password});
              }
            },
            title: 'Sign up',
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.38,
              vertical: Config.screenHeight! * 0.02,
            ),
          ),
          // TextWithTextButton(
          //   text: 'Already have an account?',
          //   textButtonText: 'Sign in',
          //   onPressed: () => Get.offAll(() => Root()),
          // ),
        ],
      ),
    );
  }
}
