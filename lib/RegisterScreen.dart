import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();

  List<dynamic> email1 = [];
  List<dynamic> password1 = [];
  List<dynamic> name1 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('email1', email1.map((e) => e.toString()).toList());
    prefs.setStringList(
        'password1', password1.map((e) => e.toString()).toList());
    prefs.setStringList('name1', name1.map((e) => e.toString()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFBCCE3),
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "assets/4074779-02.png",
                  height: 250,
                  width: 290,
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 510,
                width: double.infinity,
                child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 10, color: Colors.white),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          topRight: Radius.circular(80),
                        )),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, top: 30.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Color(0xffB40300), fontSize: 30),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 39.0, top: 5.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  Text(
                                    "Already have an Account?",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IceCreamShopApp(),
                                          ));
                                    },
                                    child: Text(
                                      " Login Now",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 42.0, top: 15.0, bottom: 4.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, right: 35.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.green)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xffB40300))),
                                    filled: true,
                                    hintText: "Enter your email here",
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      Icons.email,
                                      color: Color(0xffB40300),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 42.0, top: 20.0, bottom: 4.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, right: 35.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextField(
                                obscureText: true,
                                obscuringCharacter: "*",
                                controller: password,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.green)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xffB40300))),
                                    filled: true,
                                    hintText: "Enter your password here",
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0xffB40300),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 42.0, top: 20.0, bottom: 4.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 35.0, right: 35.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextField(
                                controller: name,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.green)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xffB40300))),
                                    filled: true,
                                    hintText: "Enter your name here",
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(
                                      Icons.person,
                                      color: Color(0xffB40300),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35.0, right: 35.0, top: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {
                                    if (email.text.toString().isNotEmpty &&
                                        password.text.toString().isNotEmpty &&
                                        name.text.toString().isNotEmpty) {
                                      var mail = email.text.toString();
                                      var pass = password.text.toString();
                                      var nam = name.text.toString();
                                      email1.add(mail);
                                      password1.add(pass);
                                      name1.add(nam);
                                      saveData();
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                              "User Created..",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 19),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("OK"))
                                            ],
                                          );
                                        },
                                      );
                                      Timer(Duration(seconds: 2), () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  IceCreamShopApp(),
                                            ));
                                      });
                                      email.clear;
                                      password.clear;
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: 60,
                                    child: Card(
                                      child: Center(
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      color: Color(0xffB40300),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
