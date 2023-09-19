import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({super.key});

  @override
  State<ReviewCard> createState() => _HomeScreenState();
}

TextEditingController nameControlar = TextEditingController();
TextEditingController emailControlar = TextEditingController();

class _HomeScreenState extends State<ReviewCard> {
  //ye fungtion signout kleliye hai ============================================================
  // void logout() async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.popUntil(context, (route) => route.isFirst);
  //   Navigator.pushReplacement(
  //       context, CupertinoPageRoute(builder: (context) => SignInWithPhone()));
  // }

//yaha tak hai ====================================================================================

//  yaha se save user code hai ==================================================================
  void saveUser() {
    String name = nameControlar.text.trim();
    String email = emailControlar.text.trim();
    if (name != "" && email != "") {
      Map<String, dynamic> userdata = {"name": name, "email": email};
      FirebaseFirestore.instance.collection("users").add(userdata);
      print("User add");
      nameControlar.clear();
      emailControlar.clear();
    } else {
      print("pleas fill all section");
    }
  }

//yaha tak user save code hai =========================================================================
//yaha se deleate fungtion hai=====================================================
  void deluser() async {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    await _firebase.collection("user").doc("5fznnhqrg3PKSYnhC5qX").delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appbar,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         // logout();
        //       },
        //       icon: const Icon(Icons.logout))
        // ],
        title: const Text("Review Pages"),
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, Index) {
                                  Map<String, dynamic> usermap =
                                      snapshot.data!.docs[Index].data();
                                  return ListTile(
                                    title: Text(usermap["name"]),
                                    subtitle: Text(usermap["email"]),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete)),
                                  );
                                }),
                          );
                        } else {
                          return Text("No Data");
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 151, 150, 146),
                      borderRadius: BorderRadius.circular(30)),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: nameControlar,
                              decoration:
                                  InputDecoration(hintText: "Enter Your name"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              child: TextField(
                                maxLines:
                                    null, // Allows unlimited lines for scrolling
                                keyboardType: TextInputType.multiline,
                                controller: emailControlar,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Experience",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  saveUser();
                                },
                                child: Text("Save")),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
