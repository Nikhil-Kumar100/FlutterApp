import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _editprofileState();
}

class _editprofileState extends State<EditProfile> {
  TextEditingController nameControlar = TextEditingController();
  TextEditingController emailControlar = TextEditingController();
  File? profileimages;
  void saveData() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        XFile? selectimage = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (selectimage != null) {
                          File convertimage = File(selectimage.path);

                          setState(() {
                            profileimages = convertimage;
                          });
                          print("image Uplod");
                        } else {
                          print("no image");
                        }
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: (profileimages != null)
                            ? FileImage(profileimages!)
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber,
                    ),
                    padding: EdgeInsets.all(35),
                    width: 400,
                    height: 350,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Enter Your name"),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(hintText: "Enter Your Email"),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Save")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
