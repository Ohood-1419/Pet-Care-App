import 'package:app/clincs/root.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:app/config.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/widgets/hero_title.dart';
import 'package:app/widgets/rounded_elevated_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference clinc = FirebaseFirestore.instance.collection("clinc");
  List clin = [];
  getdata() async {
    var res = await clinc.get();
    res.docs.forEach((element) {
      setState(() {
        clin.add(element.data());
      });
    });
    print(clin);
    print("pet****");
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  final Stream<QuerySnapshot> clincs =
      FirebaseFirestore.instance.collection("clinc").snapshots();
  @override
  Widget build(BuildContext context) {
    return Center(child: GetBuilder<AuthController>(
      builder: (_authController) {
        return Container(
          color: kBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Wellcom to ${_authController.displayName.toString().capitalizeString()} Clinic !',
                  style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(27.0),
                  child: Image.asset("assets/P1.png"),
                ),
                Text('Email :${_authController.userProfile!.email.toString()}',
                    style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),

                Expanded(flex: 4, child: Container()),

                //
                RoundedElevatedButton(
                  title: 'Sign out',
                  onPressed: () {
                    _authController.signout();
                    Get.to(Clinc());
                  },
                  padding: EdgeInsets.symmetric(
                      horizontal: Config.screenWidth! * 0.2),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
