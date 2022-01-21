import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/auth_controller.dart';

import 'package:app/widgets/rounded_elevated_button.dart';
import 'package:app/widgets/text_with_textbutton.dart';

import '../../../config.dart';
import '../../root.dart';

class SignUpButtons extends StatelessWidget {
  final _authController = Get.find<AuthController>();
  CollectionReference clinc = FirebaseFirestore.instance.collection("clinc");

  SignUpButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController loctionController,
    required TextEditingController timeController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _loctionController = loctionController,
        _timeController = timeController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _loctionController;
  final TextEditingController _timeController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: Config.screenHeight! * 0.02),
          RoundedElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                String name = _nameController.text.trim();
                String email = _emailController.text.trim();
                String password = _passwordController.text;
                String loction = _loctionController.text;
                String time = _timeController.text;
                _authController.signUp(name, email, password);

                await clinc.add({
                  "clincname": name,
                  "email": email,
                  "password": password,
                  "loc": loction,
                  "time": time
                });
                Get.offAll(Clinc());
              }
            },
            title: 'Sign up',
            padding: EdgeInsets.symmetric(
              horizontal: Config.screenWidth! * 0.38,
              vertical: Config.screenHeight! * 0.02,
            ),
          ),
          TextWithTextButton(
            text: 'Already have an account?',
            textButtonText: 'Sign in',
            onPressed: () => Get.offAll(() => Clinc()),
          ),
        ],
      ),
    );
  }
}
