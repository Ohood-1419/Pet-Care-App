
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late Reference refstorge;
    var name;
    var newEmail;
    var newPass;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("assets/19.jpg"))),
            ),
            Positioned(
                top: 150,
                left: 80,
                child: RawMaterialButton(
                    elevation: 20,
                    fillColor: Colors.purple,
                    child: Icon(Icons.add_a_photo),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    onPressed: () async {
                      var uplimg = await ImagePicker()
                          .getImage(source: ImageSource.gallery);
                      // controller.getImage(ImageSource.abs);
                      // File file;
                      if (uplimg != null) {
                        // file = File(uplimg.path);
                        var rand = Random().nextInt(10000);
                        var nameimg = "$rand" + basename(uplimg.path);
                        refstorge =
                            FirebaseStorage.instance.ref("images/$nameimg");

                        // await refstorge.putFile(file);
                        // var url = await refstorge
                        //     .getDownloadURL();
                        // print(url);
                      }
                    })),
            SizedBox(
              height: 70,
            ),
            //for edit profile+>>>>>>
//edit name
            new ListTile(
              trailing: Icon(Icons.edit),
              leading: Icon(
                Icons.supervised_user_circle_outlined,
              ),
              title: new Text('edit your name'),
              onTap: () {
                Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: Color(0xFFFFFFFF),
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
                                    'Update your name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: " Name",
                                      hintText: 'ohood',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                      name = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // ElevatedButton(onPressed: onPressed, child: child)
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.currentUser!
                                          .updateDisplayName(name);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF7E149B), // background
                                      onPrimary: Colors.white, // foreground
                                    ),

                                    //  color: const Color(0xFF7E149B),
                                  )
                                ]))))));

                // profileCtrl.deleteMemoryImage();
              },
            ),
            new ListTile(
              trailing: Icon(Icons.edit),
              leading: Icon(
                Icons.email,
              ),
              title: new Text('edit your email'),
              onTap: () {
                Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: Color(0xFFFFFFFF),
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
                                    'Update your email',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: " Email",
                                      hintText: 'ohood@gmail.com',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                      newEmail = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // ElevatedButton(onPressed: onPressed, child: child)
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.currentUser!
                                          .updateEmail(newEmail);

                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF7E149B), // background
                                      onPrimary: Colors.white, // foreground
                                    ),

                                    //  color: const Color(0xFF7E149B),
                                  )
                                ]))))));
                // profileCtrl.deleteMemoryImage();
                // Navigator.of(context).pop();
              },
            ),
            new ListTile(
              trailing: Icon(Icons.edit),
              leading: Icon(
                Icons.password,
              ),
              title: new Text('edit your password'),
              onTap: () {
                Get.bottomSheet(Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: Color(0xFFFFFFFF),
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
                                    'Update your Password',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: " Password",
                                      hintText: '********',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
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
                                      newPass = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // ElevatedButton(onPressed: onPressed, child: child)
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseAuth.instance.currentUser!
                                          .updatePassword((newPass));

                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF7E149B), // background
                                      onPrimary: Colors.white, // foreground
                                    ),

                                    //  color: const Color(0xFF7E149B),
                                  )
                                ]))))));
              },
            ),
            SizedBox(
              height: 70,
            ),
            Center(
              child: ListTile(
                leading: Icon(
                  Icons.delete,
                ),
                title: new Text('Delete your profile'),
                onTap: () {
                  FirebaseAuth.instance.currentUser!.delete();
                  // profileCtrl.deleteMemoryImage();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class profileController extends GetxController {



  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print("image_path save");
    //  usersImageAdd(selectedImagePath.value, FirebaseAuth.instance.currentUser!.uid);

    } else {
      Get.snackbar("Hata !", "Fotoğraf Seçilmedi",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white);
    }
  }

  fireStore_Get_ImagePath() {
    FirebaseFirestore.instance
        .collection("usersImage").where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc != null){
          if(FirebaseAuth.instance.currentUser!.uid == doc["uid"]){
            selectedImagePath.value = doc["image_path"];
       
          }else{
            selectedImagePath.value = '';
          
          }

        }
      });
    });

  }
 
void deleteMemoryImage(){
 selectedImagePath.value = '';
}
}




///////////////////////////////////

 profileController profileCtrl = Get.put(profileController());
  Widget _headerImage(context) {
    return Container(
      //  height: displayHeight(context) * 0.4,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Obx(
                  () => CircleAvatar(
                      radius: 75,
                      backgroundColor: Color(0xffFDCF09),
                      child: profileCtrl.selectedImagePath.value != ''
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(
                                File((profileCtrl.selectedImagePath.value)),
                              ))
                          : CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                 AssetImage("assets/19.jpg")  
                                  )),
                ),
                Positioned(
                  top: 100,
                  left: 65,
                  child: RawMaterialButton(
                    elevation: 10,
                    fillColor: Colors.yellow,
                    child: Icon(Icons.add_a_photo),
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    onPressed: () {
                      _showPicker(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


////////////////////////////////////////////

void _showPicker(context) {
  profileController profileCtrl = Get.put(profileController());
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Fotoğraf Galerisi'),
                    onTap: () {
                      profileCtrl.getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Kamera'),
                  onTap: () {
                    profileCtrl.getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.delete),
                  title: new Text('Fotoğrafı Kaldır'),
                  onTap: () {
                    profileCtrl.deleteMemoryImage();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}
 */
