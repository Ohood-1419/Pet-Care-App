import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:ui';
import '../Diagnose.dart';
import '../appointment.dart';
import '../homepage.dart';

import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/auth_controller.dart';

import 'package:image_picker/image_picker.dart';

import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'drwer.dart';

class Home extends StatefulWidget {
  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pet = [];

  late Reference restorge;
  static String? petname;
  // static DateTime? dat;
  var dat;
  static String? img;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  static String? saveData; //= '22/22/2222'; // TODO:
  // static HomeController controller = Get.put(HomeController());
  // static AuthController authcontroller = Get.put(AuthController());

  late File file;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagepic = ImagePicker();
  CollectionReference upets = FirebaseFirestore.instance.collection("pet");

  getdata() async {
    var res = await upets.get();
    res.docs.forEach((element) {
      setState(() {
        pet.add(element.data());
      });
    });
    print(pet);
    print("pet****");
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  BoxDecoration _cardDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
      boxShadow: [
        BoxShadow(
            color: Color(0xFFc6c6c6), offset: Offset(1, 3), blurRadius: 9),
      ],
    );
  }

  // Image _imageSection(String imgUrl) {
  //   return Image.asset(
  //     imgUrl,
  //     width: 150,
  //     height: 150,
  //     fit: BoxFit.contain,
  //   );
  // }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: currentDate,
            firstDate: DateTime(2015),
            lastDate: DateTime(2050))
        .then((value) {
      saveData = value.toString();
      print(value.toString());
    });
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        var date = pickedDate;
        dat = dateFormat.format(pickedDate) as DateTime?;
        dat = dat;
        debugPrint('$pickedDate');
        //saveData = pickedDate.toString(); //TODO: --
        debugPrint('in select method:  $saveData');

        //.ToString("yyyyMMdd");
      });
    }
  }

  String _age(DateTime dob) {
    var duration = DateTime.now().difference(dob).inDays;
    var age = duration ~/ 365;

    if (age > 1) {
      return '$age years old';
    }
    return '$age year old';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBD8F0),
        appBar: AppBar(
          title: Text("My Pet Care App"),
          leading: IconButton(
            icon: Icon(Icons.menu), // set your color here
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        drawer: DrawerScreen(),
        body:
            // Obx(() {
            //   return
            Container(
          color: const Color(0xFFEBD8F0),
          child: Column(
            children: [
              Container(
                  child: GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (_authController) {
                        return Container(
                            padding: EdgeInsets.all(20),
                            color: const Color(0xFFEBD8F0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello ${_authController.displayName.toString().capitalizeString()}!',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Let\'s being.....',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                ]));
                      })),
              SizedBox(
                height: 34,
                width: 30,
              ),
              Expanded(flex: 1, child: Container()),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Text(
                      '   Your Pets:',
                      style: TextStyle(
                        fontFamily: 'Cambria Math',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff000000),
                        letterSpacing: -0.3214286041259766,
                        height: 1,
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                    ),
                    FloatingActionButton.extended(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                              color: const Color(0xFFEBD8F0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16, bottom: 16),
                              child: Form(
                                //Home.controller.formKey
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pet information',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          labelText: "Pet Name",
                                          hintText: 'lovy',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        // controller: controller.nameController,
                                        validator: (value) {
                                          if (value!.length > 100) {
                                            return "Name can not be larger than 255";
                                          }
                                          return null;
                                        },
                                        onSaved: (val) {
                                          petname = val;
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      // ElevatedButton(onPressed: onPressed, child: child)
                                      ElevatedButton(

// )

                                          onPressed: () => _selectDate(
                                              context), // Refer step 3
                                          child: Text(
                                            'Select date',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // style:
                                          // ElevatedButton.styleFrom(

                                          //   primary:
                                          //       Color(0xFF7E149B), // background
                                          //   onPrimary: Colors.white,

                                          // ),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Color(0xFF7E149B),
                                                          width: 2.0))))
                                          //  color: const Color(0xFF7E149B),
                                          ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Choose picture for pet profile :',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0)),
                                            onPressed: () async {
                                              var uplimg = await ImagePicker()
                                                  .getImage(
                                                      source:
                                                          ImageSource.camera);
                                              // controller.getImage(ImageSource.abs);

                                              if (uplimg != null) {
                                                file = File(uplimg.path);
                                                var rand =
                                                    Random().nextInt(10000);
                                                var nameimg = "$rand" +
                                                    basename(uplimg.path);
                                                restorge = FirebaseStorage
                                                    .instance
                                                    .ref("images/$nameimg");

                                                await restorge.putFile(file);
                                                var url = await restorge
                                                    .getDownloadURL();
                                                print(url);
                                              }
                                            },
                                            color: Colors.purple,
                                            padding: EdgeInsets.all(5.0),
                                            child: Column(
                                              // Replace with a Row for horizontal icon + text
                                              children: <Widget>[
                                                Icon(Icons.camera_alt,
                                                    color: Colors.white),
                                                Text(
                                                  "camera",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          FlatButton(
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0)),
                                            onPressed: () async {
                                              var takeimg = await ImagePicker()
                                                  .getImage(
                                                      source:
                                                          ImageSource.gallery);
                                              // controller.getImage(ImageSource.abs);

                                              if (takeimg != null) {
                                                file = File(takeimg.path);
                                                var rand =
                                                    Random().nextInt(10000);
                                                var nameimg = "$rand" +
                                                    basename(takeimg.path);
                                                restorge = FirebaseStorage
                                                    .instance
                                                    .ref("images/$nameimg");
                                                print("photo");
                                                await restorge.putFile(file);
                                                var url = await restorge
                                                    .getDownloadURL();
                                                print(url);
                                              }
                                            },

                                            //uploudimag
                                            color: Colors.purple,
                                            padding: EdgeInsets.all(5.0),
                                            child: Column(
                                              // Replace with a Row for hrizontal icon + text
                                              children: <Widget>[
                                                Icon(Icons.album,
                                                    color: Colors.white),
                                                Text(
                                                  "album",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(
                                            width: Get.context!.width,
                                            height: 45),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Color(0x84645669),
                                                          width: 1.0)))),
                                          child: Text(
                                            "Add",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                          onPressed: () async {
                                            // await addpet();
                                            var fordata = formKey.currentState;
                                            if (fordata!.validate()) {
                                              fordata.save();
// here
                                              //if (dat != null) {
                                              debugPrint('******** $saveData');
                                              await restorge.putFile(file);
                                              img = await restorge
                                                  .getDownloadURL();
                                              await upets.add({
                                                "petname": petname,
                                                "date": saveData,
                                                "img": img,
                                                "userid": FirebaseAuth
                                                    .instance.currentUser!.uid,
                                              });

                                              // }
                                              print("A");
                                              Get.to(Home());
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                        print("ADDDDDDDDDDDDDDDDDDD");
                      },
                      label: Text('Add Pet'),
                    ),
                  ],
                ),
              ),
              Center(
                child: SizedBox(
                  height: 240,
                  width: double.infinity,
                  child: pet.isEmpty || pet == null
                      ? Text("loading ..")
                      : ListView.builder(
                          itemCount: pet.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            final petName = Text(pet[i]["petname"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF303132)));
                            //  _age(new DateFormat('yyyy/MM/dd').parse(pet[i]["date"]))  ;
                            final petAge = Text(
                                _age(DateTime.parse(pet[i]["date"])),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Colors.grey,
                                    letterSpacing: 1));

                            final imgUrl = Image.network(
                              pet[i]["img"],
                              width: 150,
                              height: 150,
                              fit: BoxFit.contain,
                            );

                            return Card(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  imgUrl,
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  petName,
                                  //      petAge
                                  petAge,
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
              Expanded(flex: 7, child: Container()),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  ' Featured Activities:',
                  style: TextStyle(
                    fontFamily: 'Cambria Math',
                    fontSize: 17,
                    //   fontWeight: FontWeight.bold,
                    color: const Color(0xff000000),
                    letterSpacing: -0.3214286041259766,
                    height: 1,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 240,
                width: 310,
                child: Center(
                  child: ListView(
                    children: [
                      FloatingActionButton.extended(
                        icon: Icon(Icons.schedule),
                        onPressed: () => Get.to(Appointment()),
                        label: Text('Schedule your pet vaccine'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton.extended(
                        icon: Icon(Icons.location_pin),
                        onPressed: () {
                          Get.to(HomePage());
                        },
                        label: Text('Find your  veterinary clinic'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FloatingActionButton.extended(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        //Diagnose
                        onPressed: () => Get.to(Diagnose()),
                        label: Text('Diagnose your pet eye'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 90, child: Container()),
            ],
          ),
        )
        // }),
        );
  }
}
