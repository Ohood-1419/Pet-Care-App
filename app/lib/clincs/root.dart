import 'package:app/clincs/home/home.dart';
import 'package:app/clincs/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:app/controller/auth_controller.dart';

import '../config.dart';

class Clinc extends StatelessWidget {
  const Clinc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GetBuilder<AuthController>(
        builder: (_) {
          return SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Config.screenWidth! * 0.04),
                child: _.isSignedIn.value ? Home() : SignIn()),
          );
        },
      ),
    );
  }
}
