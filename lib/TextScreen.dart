import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class TextScreen extends StatefulWidget {
  var email, pass;
  TextScreen(this.email, this.pass, {super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/4074779-02.png",
                height: 500,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))),
          ),
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
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Email Details",
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 30),
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
                              enabled: false,
                              decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  filled: true,
                                  hintText: "${widget.email}",
                                  fillColor: Colors.white,
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
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
                              enabled: false,
                              decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  filled: true,
                                  hintText: "${widget.pass}",
                                  fillColor: Colors.white,
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 35.0, right: 35.0, top: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 60,
                              child: Card(
                                child: Center(
                                  child: Text(
                                    "Thank You",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23),
                                  ),
                                ),
                                color: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ])),
            ),
          ),
        ],
      ),
    );
  }
}
