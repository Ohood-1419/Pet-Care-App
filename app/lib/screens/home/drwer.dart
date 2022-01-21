import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:app/controller/auth_controller.dart';

import '../Setting.dart';
import '../about.dart';

import '../appointment.dart';
import '../homepage.dart';
import '../petview.dart';
import '../polisy.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.pink[50],
        ),
        child: Container(
            child: GetBuilder<AuthController>(builder: (_authController) {
          return Container(
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(
                        '${_authController.displayName.toString().capitalizeString()}'),
                    accountEmail: Text(
                        '${_authController.userProfile!.email.toString()}'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(child: Image.asset("assets/19.jpg")),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.edit_attributes),
                    title: Text("Edit pets"),
                    onTap: () => Get.to(PetView()),
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text("Schedule appointment"),
                    //Appointment
                    onTap: () => Get.to(Appointment()),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_pin),
                    title: Text(" Your location"),
                    onTap: () {
                      Get.to(HomePage());
                    },
                    // =>  Get.to(Map())
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(" Settings "),
                    onTap: () {
                      Get.to(Settings());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Change language"),
                    onTap: () {},
                  ),
                  ListTile(
                      leading: Icon(Icons.privacy_tip_outlined),
                      title: Text(" Privacy Policy "),
                      onTap: () => Get.to(Policy())),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About"),
                    onTap: () => Get.to(About()),
                  ),
                  SizedBox(
                    height: 115,
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("  Sign out"),
                    onTap: () => _authController.signout(),
                  ),
                ],
              ),
            ),
          );
        })));
  }
}


  //  Container(child: GetBuilder<AuthController>(
      //   builder: (_authController) {
      //     return Container(
      //       child: Column(
      //         children: [
      //            Text(
      //           '${_authController.displayName.toString().capitalizeString()}',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontFamily: 'Roboto',
      //             fontWeight: FontWeight.bold,
      //             fontSize: 14,
      //           ),),

      // SizedBox(height:520 ,),
      //           RoundedElevatedButton(
      //             title: 'Sign out',
      //             onPressed: () => _authController.signout(),
      //             padding: EdgeInsets.symmetric(
      //                 horizontal: Config.screenWidth! * 0.2),
      //           ),
      //         ],
      //       ),

