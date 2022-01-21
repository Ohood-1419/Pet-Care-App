import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/screens/reset_password/forgetpasswordpage.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/screens/home/home.dart';

import 'package:app/screens/sign_up/sign_up.dart';
import 'package:app/widgets/rounded_elevated_button.dart';
import 'package:app/widgets/text_with_textbutton.dart';

import '../../../config.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final _authController = Get.find<AuthController>();

    return Column(
//mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text('Forgot Password?'),
            onPressed: () => Get.to(() => Forgotpassword1()),
            //Forgotpassword1()
            style: ButtonStyle(
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.purple),
            ),
          ),
        ),

        //     // Adobe XD layer: 'Area' (shape)
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            primary: Color(0xff8a56ac),
            shape: StadiumBorder(),
          ),

          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String email = _emailController.text.trim();
              String password = _passwordController.text;

              _authController.signIn(email, password);
              Get.offAll(Home());
              // Get.offAll(Home());
            }
          },
          child: Text(
            "Sign in",
            style: TextStyle(fontSize: 20),
          ),
          //  Mainpage1()
        ),

        // RoundedElevatedButton(
        //   title: 'Sign in',
        //   onPressed: () {
        //     if (_formKey.currentState!.validate()) {
        //       String email = _emailController.text.trim();
        //       String password = _passwordController.text;

        //       _authController.signIn(email, password);
        //       Get.offAll(Home());
        //     }
        //   },

        // ),

        // TextWithTextButton(
        //   text: 'Don\'t have an account?',
        //   textButtonText: 'Sign up',
        //   onPressed: () => Get.to(() => SignUp()),
        // ),
      ],
    );
  }
}
