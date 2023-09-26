import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:IceCreamShopApp/RegisterScreen.dart';
import 'package:IceCreamShopApp/TextScreen.dart';
import 'package:IceCreamShopApp/utils/sharedPreferencelogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';

class IceCreamShopApp extends StatefulWidget {
  const IceCreamShopApp({super.key});

  @override
  State<IceCreamShopApp> createState() => _IceCreamShopAppState();
}

class _IceCreamShopAppState extends State<IceCreamShopApp> {
  var email = TextEditingController();
  var password = TextEditingController();

  List<dynamic> email11 = [];
  List<dynamic> password11 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferenceLogin().getemailList().then((email) {
      setState(() {
        email11 = email;
      });
    });
    SharedPreferenceLogin().getpassList().then((pass) {
      setState(() {
        password11 = pass;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBCCE3),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/4074779-02.png",
                height: 330,
                width: MediaQuery.of(context).size.width,
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
                          padding: const EdgeInsets.only(left: 35.0, top: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Welcome",
                              style: TextStyle(
                                  color: Color(0xffB40300), fontSize: 30),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 39.0, top: 5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ));
                                  },
                                  child: Text(
                                    " Register Now",
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
                                          width: 1, color: Color(0xffB40300))),
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
                                          width: 1, color: Color(0xffB40300))),
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
                              left: 35.0, right: 35.0, top: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  var mail = email.text.toString();
                                  var pass = password.text.toString();

                                  if (email11.contains(mail) &&
                                      password11.contains(pass)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                              email11.indexOf(mail))),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(
                                            "No User Found",
                                            style: TextStyle(
                                                color: Colors.red,
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
                                  }

                                  email.clear();
                                  password.clear();
                                },
                                child: Container(
                                  height: 60,
                                  child: Card(
                                    child: Center(
                                      child: Text(
                                        "Login",
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
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 35.0, right: 35.0, top: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                "or Login with",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 130.0, right: 130.0, top: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 30,
                                      child:
                                          Image.asset("assets/google (1).png")),
                                  Container(
                                      height: 30,
                                      child: Image.asset(
                                          "assets/facebook (3).png")),
                                  Container(
                                      height: 30,
                                      child: Image.asset(
                                          "assets/instagram (2).png"))
                                ]),
                          ),
                        )
                      ])),
            ),
          ),
        ],
      ),
    );
  }
}
