import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class PetView extends StatefulWidget {
  static String? petname;
  // static DateTime? dat;
  static String? img;

  @override
  _PetViewState createState() => _PetViewState();
}

class _PetViewState extends State<PetView> {
  updateData() async {
    CollectionReference updpets = FirebaseFirestore.instance.collection("pet");
// i need pet id
    updpets.doc("").update({
      "petname": petname,
      "date": saveData,
      "img": img,
      "userid": FirebaseAuth.instance.currentUser!.uid,
    });
    // var res = await pets.get();
    setState(() {
      //   petList.add(res.data());
    });

    // petList.add(res.data());

    // print("pet****");
  }

  @override
  void initState() {
    updateData();
    super.initState();
  }

  late Reference refstorge;
  static String? petname;
  // static DateTime? dat;
  var dat;
  static String? img;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  static String? saveData;
  // static HomeController controller = Get.put(HomeController());
  // static AuthController authcontroller = Get.put(AuthController());

  late File file;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagepic = ImagePicker();
  CollectionReference upets = FirebaseFirestore.instance.collection("pet");

  String _age(DateTime dob) {
    var duration = DateTime.now().difference(dob).inDays;
    var age = duration ~/ 365;

    if (age > 1) {
      return '$age years old';
    }
    return '$age year old';
  }

  String path = FirebaseAuth.instance.currentUser!.uid;

  final Stream<QuerySnapshot> pets = FirebaseFirestore.instance
      .collection("pet")
      .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

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
        dat = dateFormat.format(pickedDate) as DateTime?;
        dat = dat;
        debugPrint('$pickedDate');

        debugPrint('in select method:  ${saveData}');

        //.ToString("yyyyMMdd");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // DocumentReference pet = FirebaseFirestore.instance
    //     .collection("pet")
    //     .doc(FirebaseAuth.instance.currentUser!.uid);
    // CollectionReference upets = FirebaseFirestore.instance.collection("pet");
    return Scaffold(
        appBar: AppBar(
          title: Text("Pets"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: pets,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  //  snapshot.data!.docs.where("userid", isEqualT:FirebaseAuth.instance.currentUser!.uid);
                  return ListTile(
                    onLongPress: () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Update Pet information',
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
                                        //                                      style: ButtonStyle(
                                        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        //   RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     //side: BorderSide(color: Colors.red)
                                        //   )
                                        // )
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
                                                    source: ImageSource.camera);
                                            // controller.getImage(ImageSource.abs);

                                            if (uplimg != null) {
                                              file = File(uplimg.path);
                                              var rand =
                                                  Random().nextInt(10000);
                                              var nameimg = "$rand" +
                                                  basename(uplimg.path);
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              await refstorge.putFile(file);
                                              var url = await refstorge
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
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              await refstorge.putFile(file);
                                              var url = await refstorge
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
                                          "Update",
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
                                            debugPrint('******** ${saveData}');
                                            await refstorge.putFile(file);
                                            img = await refstorge
                                                .getDownloadURL();
                                            // i use set it was add

                                            updateData();
                                            Navigator.of(context).pop();

                                            //  Navigator.of(context).pop();
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
                    },
                    title: Text(data["petname"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF303132))),
                    subtitle: Text(_age(DateTime.parse(data["date"])),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.grey,
                            letterSpacing: 1)),
                    leading: Image.network(
                      data["img"],
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.app.delete();
                          // profileCtrl.deleteMemoryImage();
                          Navigator.of(context).pop();
                          //  pet.path.compareTo(pet['userid']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }).toList(),
              );
            })

        /// stop

        );
  }
}

/**
 * 
 * 
 * 
 * 
 * 
 * 
 * ListView.builder(
                          itemCount: petList.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            final petName = Text(petList[i]["petname"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF303132)));
                            //  _age(new DateFormat('yyyy/MM/dd').parse(pet[i]["date"]))  ;
                            final petAge = Text(
                                _age(DateTime.parse(petList[i]["date"])),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    color: Colors.grey,
                                    letterSpacing: 1));

                            final imgUrl = Image.network(
                              petList[i]["img"],
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

                                  IconButton(onPressed: (){},  icon: Icon(Icons.update ))
                                ],
                              ),
                            );
                          },
                        ),








                        ///***************************stop */
                        ///
                        ///
                        ///
                        ///        return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                      title: Text(data["petname"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xFF303132))),
                      subtitle: Text(_age(DateTime.parse(data["date"])),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.grey,
                              letterSpacing: 1)),
                      leading: Image.network(
                        data["img"],
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.update)));
                }).toList(),
              );






              ////***********************hhh */
              ///
              ///
              ///
              ///
              ///  final Stream<QuerySnapshot> pets =
      FirebaseFirestore.instance.collection("pet").snapshots();

//await FirebaseFirestore.instance.namedQueryGet('sports-teams', options: const GetOptions(source: Source.cache));
// /**
//  *
// //  *   final Stream<QuerySnapshot> pets = FirebaseFirestore.instance
// //       .collection("pet")
// //       .snapshots(includeMetadataChanges: true);
//  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pets"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: pets,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                      title: Text(data["petname"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xFF303132))),
                      subtitle: Text(_age(DateTime.parse(data["date"])),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Colors.grey,
                              letterSpacing: 1)),
                      leading: Image.network(
                        data["img"],
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.update)));
                }).toList(),
              );
            })

        /// stop

        );
  }
}

 */

///************************************************************************ */
///
///
///
///
/* StreamBuilder<QuerySnapshot>(
            stream: pets,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                //  snapshot.data!.docs.where("userid", isEqualT:FirebaseAuth.instance.currentUser!.uid);
                  return ListTile(
                    onLongPress: () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Update Pet information',
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
                                        //                                      style: ButtonStyle(
                                        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        //   RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     //side: BorderSide(color: Colors.red)
                                        //   )
                                        // )
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
                                                    source: ImageSource.camera);
                                            // controller.getImage(ImageSource.abs);

                                            if (uplimg != null) {
                                              file = File(uplimg.path);
                                              var rand =
                                                  Random().nextInt(10000);
                                              var nameimg = "$rand" +
                                                  basename(uplimg.path);
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              // await refstorge.putFile(file);
                                              // var url = await refstorge
                                              //     .getDownloadURL();
                                              // print(url);
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
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              // await refstorge.putFile(file);
                                              // var url = await refstorge
                                              //     .getDownloadURL();
                                              // print(url);
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
                                          "Update",
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
                                            debugPrint('******** ${saveData}');
                                            await refstorge.putFile(file);
                                            img = await refstorge
                                                .getDownloadURL();
                                            //i use set it was add

                                            updateData();
                                            Navigator.of(context).pop();
                                            // await pet.update({
                                            //   "petname": petname,
                                            //   "date": saveData,
                                            //   "img": img,
                                            //   "userid": FirebaseAuth
                                            //       .instance.currentUser!.uid,
                                            // });

                                            // }
                                            // Navigator.of(context)
                                            //     .pushReplacement(
                                            //         MaterialPageRoute(
                                            //             builder: (context) =>
                                            //                 PetView()));
                                            //  Navigator.of(context).pop();
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
                    },
                    title: Text(data["petname"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF303132))),
                    subtitle: Text(_age(DateTime.parse(data["date"])),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.grey,
                            letterSpacing: 1)),
                    leading: Image.network(
                      data["img"],
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.app.delete();
                          // profileCtrl.deleteMemoryImage();
                          Navigator.of(context).pop();
                          //  pet.path.compareTo(pet['userid']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    iconColor: Colors.grey,
                  );
                }).toList(),
              );
            })

        /// stop

        );
  }
}
*
*/

/*

class _PetViewState extends State<PetView> {
  updateData() async {
    CollectionReference updpets = FirebaseFirestore.instance.collection("pet");
// i need pet id
    updpets.doc("").update({
      "petname": petname,
      "date": saveData,
      "img": img,
      "userid": FirebaseAuth.instance.currentUser!.uid,
    });
    // var res = await pets.get();
    setState(() {
      //   petList.add(res.data());
    });

    // petList.add(res.data());

    // print("pet****");
  }

  @override
  void initState() {
    updateData();
    super.initState();
  }

  late Reference refstorge;
  static String? petname;
  // static DateTime? dat;
  var dat;
  static String? img;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  static String? saveData;
  // static HomeController controller = Get.put(HomeController());
  // static AuthController authcontroller = Get.put(AuthController());

  late File file;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagepic = ImagePicker();
  CollectionReference upets = FirebaseFirestore.instance.collection("pet");

  String _age(DateTime dob) {
    var duration = DateTime.now().difference(dob).inDays;
    var age = duration ~/ 365;

    if (age > 1) {
      return '$age years old';
    }
    return '$age year old';
  }

  String path = FirebaseAuth.instance.currentUser!.uid;

  final Stream<QuerySnapshot> pets = FirebaseFirestore.instance
      .collection("pet")
      .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

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
        dat = dateFormat.format(pickedDate) as DateTime?;
        dat = dat;
        debugPrint('$pickedDate');

        debugPrint('in select method:  ${saveData}');

        //.ToString("yyyyMMdd");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // DocumentReference pet = FirebaseFirestore.instance
    //     .collection("pet")
    //     .doc(FirebaseAuth.instance.currentUser!.uid);
    // CollectionReference upets = FirebaseFirestore.instance.collection("pet");
    return Scaffold(
        appBar: AppBar(
          title: Text("Pets"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: pets,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  //  snapshot.data!.docs.where("userid", isEqualT:FirebaseAuth.instance.currentUser!.uid);
                  return ListTile(
                    onLongPress: () {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Update Pet information',
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
                                        //                                      style: ButtonStyle(
                                        // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        //   RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     //side: BorderSide(color: Colors.red)
                                        //   )
                                        // )
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
                                                    source: ImageSource.camera);
                                            // controller.getImage(ImageSource.abs);

                                            if (uplimg != null) {
                                              file = File(uplimg.path);
                                              var rand =
                                                  Random().nextInt(10000);
                                              var nameimg = "$rand" +
                                                  basename(uplimg.path);
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              await refstorge.putFile(file);
                                              var url = await refstorge
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
                                              refstorge = FirebaseStorage
                                                  .instance
                                                  .ref("images/$nameimg");

                                              await refstorge.putFile(file);
                                              var url = await refstorge
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
                                          "Update",
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
                                            debugPrint('******** ${saveData}');
                                            await refstorge.putFile(file);
                                            img = await refstorge
                                                .getDownloadURL();
                                            // i use set it was add

                                            updateData();
                                            Navigator.of(context).pop();

                                            //  Navigator.of(context).pop();
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
                    },
                    title: Text(data["petname"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color(0xFF303132))),
                    subtitle: Text(_age(DateTime.parse(data["date"])),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                            color: Colors.grey,
                            letterSpacing: 1)),
                    leading: Image.network(
                      data["img"],
                      width: 150,
                      height: 150,
                      fit: BoxFit.scaleDown,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.app.delete();
                          // profileCtrl.deleteMemoryImage();
                          Navigator.of(context).pop();
                          //  pet.path.compareTo(pet['userid']);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                }).toList(),
              );
            })

        /// stop

        );
  }
}
 * ****///
//^*
/*



  Widget build(BuildContext context) {
    // DocumentReference pet = FirebaseFirestore.instance
    //     .collection("pet")
    //     .doc(FirebaseAuth.instance.currentUser!.uid);
    // CollectionReference upets = FirebaseFirestore.instance.collection("pet");
    return Scaffold(
        appBar: AppBar(
          title: Text("Pets"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: pets,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                // scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  //  snapshot.data!.docs.where("userid", isEqualT:FirebaseAuth.instance.currentUser!.uid);
                  return Column(
                    children: [
                      Card(
                          child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            data["img"],
                            width: 150,
                            height: 150,
                            fit: BoxFit.scaleDown,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data["petname"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color(0xFF303132))),
                          //      petAge
                          Text(_age(DateTime.parse(data["date"])))
                        ],
                      )),
                      ListTile(
                        title: Text(data["petname"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color(0xFF303132))),
                        subtitle: Text(_age(DateTime.parse(data["date"])),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                                color: Colors.grey,
                                letterSpacing: 1)),
                        leading: Image.network(
                          data["img"],
                          width: 150,
                          height: 150,
                          fit: BoxFit.scaleDown,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              FirebaseAuth.instance.app.delete();
                              // profileCtrl.deleteMemoryImage();
                              Navigator.of(context).pop();
                              //  pet.path.compareTo(pet['userid']);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  );
                }).toList(),
              );
            })

        /// stop

        );
  }
}
 */