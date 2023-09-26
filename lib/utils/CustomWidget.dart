import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget {
  Widget Textt(text, size) {
    return Text(
      text,
      style: TextStyle(fontSize: size),
    );
  }

  Widget Alignn(aligment, child) {
    return Align(
      alignment: aligment,
      child: child,
    );
  }

  Widget padd(padd, child) {
    return Padding(
      padding: padd,
      child: child,
    );
  }

  Widget listview(cimage, cname, cprice, function) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    child: Image.asset(
                      cimage[index],
                      fit: BoxFit.fitWidth,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    cname[index],
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                      Text(
                        "${cprice[index]}",
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xffB40300)),
                        onPressed: () {
                          function(index);
                        },
                        child: Text(
                          "Add to cart",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget listview1(
      cimage, cname, cprice, length, function, minus, plus, count) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  function(index);
                },
                child: Container(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ListTile(
                        tileColor: Colors.white,
                        leading: Container(
                          child: Image.asset(
                            cimage[index],
                            fit: BoxFit.fitHeight,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        title: Text(
                          cname[index],
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        subtitle: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "\$",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                            Text(
                              "${cprice[index]}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                          ],
                        ),
                        trailing: SizedBox(
                          width: 65,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  minus(index);
                                },
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                count[index].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              InkWell(
                                onTap: () {
                                  plus(index);
                                },
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
