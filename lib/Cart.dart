import 'package:IceCreamShopApp/payments/stripe_api.dart';
import 'package:flutter/material.dart';
import 'package:IceCreamShopApp/utils/CustomWidget.dart';
import 'package:IceCreamShopApp/utils/SharedPreferenceLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  List<dynamic> ccimage = [], ccname = [], ccprice = [];
  String name;
  final Function updateCartItemCount;

  Cart(this.ccimage, this.ccname, this.ccprice, this.updateCartItemCount,
      this.name,
      {super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<dynamic> image1 = [];
  List<dynamic> name1 = [];
  List<dynamic> price1 = [];
  List<int> itemCounts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferenceLogin().getimageList().then((image) {
      setState(() {
        image1 = image;
        itemCounts = List<int>.generate(image1.length, (index) => 1);
      });
    });
    SharedPreferenceLogin().getnammeList().then((name) {
      setState(() {
        name1 = name;
      });
    });
    SharedPreferenceLogin().getpriceList().then((price) {
      setState(() {
        price1 = price;
        countprice();
        totalprice();
      });
    });
  }

  double total = 0.0;
  Future<void> countprice() async {
    double totalPrice = 0.0;
    for (int index = 0; index < price1.length; index++) {
      totalPrice += double.tryParse(price1[index]) ?? 0.0;
    }
    setState(() {
      total = totalPrice;
    });
  }

  Future<void> minus(int index) async {
    if (index >= 0 && index < itemCounts.length && itemCounts[index] > 1) {
      setState(() {
        itemCounts[index]--;
        total -= double.tryParse(price1[index]) ?? 0.0;
      });

      // Calculate total after the state update
      Future.microtask(() {
        totalprice();
      });
    }
  }

  Future<void> plus(int index) async {
    if (index >= 0 && index < itemCounts.length && itemCounts[index] > 0) {
      setState(() {
        itemCounts[index]++;
        total += double.tryParse(price1[index]) ?? 0.0;
        totalprice();
      });
    }
  }

  Future<void> deleteFunction(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      image1.removeAt(index);
      name1.removeAt(index);
      price1.removeAt(index);
      widget.ccimage.removeAt(index);
      widget.ccname.removeAt(index);
      widget.ccprice.removeAt(index);
      itemCounts.removeAt(index);

      prefs.setStringList('ccimage', image1.map((e) => e.toString()).toList());
      prefs.setStringList('ccname', name1.map((e) => e.toString()).toList());
      prefs.setStringList('ccprice', price1.map((e) => e.toString()).toList());
      countprice();
      totalprice();
    });
  }

  double totalPrice = 0.0;
  Future<void> totalprice() async {
    double price = total;
    setState(() {
      totalPrice = price + 5.00 + 1.00;
      print(price);
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomWidget cus = CustomWidget();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFBCCE3),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Color(0xffFBCCE3),
          title: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    widget.updateCartItemCount();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              SizedBox(
                width: 130,
              ),
              Text(
                "Cart",
                style: TextStyle(fontSize: 23, color: Colors.black),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 350,
                  child: cus.listview1(image1, name1, price1, image1.length,
                      deleteFunction, minus, plus, itemCounts),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 425,
                  width: double.infinity,
                  child: Card(
                      elevation: 2,
                      color: Colors.white,
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
                                  "Payment",
                                  style: TextStyle(
                                      color: Color(0xffB40300),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35.0, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "\$",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Text(
                                        total == 0.0
                                            ? "0.00"
                                            : total.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35.0, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Charges",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "\$",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Text(
                                        "5.00",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35.0, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "\$",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Text(
                                        "1.00",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35.0, top: 20),
                              child: Container(
                                height: 3,
                                width: double.infinity,
                                color: Color(0xffB40300),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35.0, right: 35.0, top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        color: Color(0xffB40300), fontSize: 22),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "\$",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      Text(
                                        totalPrice.toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 35.0, right: 35.0),
                                child: InkWell(
                                  onTap: () async {
                                    if (total != 0.0) {
                                      int p = totalPrice.toInt();
                                      print("this is value $p");
                                      bool paymentSuccessful =
                                          await StripeAPI.makePayment(
                                              p.toString(),
                                              "USD",
                                              context); // Replace "USD" with the desired currency code
                                      if (paymentSuccessful) {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        setState(() {
                                          image1.clear();
                                          name1.clear();
                                          price1.clear();
                                          widget.ccimage.clear();
                                          widget.ccname.clear();
                                          widget.ccprice.clear();

                                          prefs.setStringList(
                                              'ccimage',
                                              image1
                                                  .map((e) => e.toString())
                                                  .toList());
                                          prefs.setStringList(
                                              'ccname',
                                              name1
                                                  .map((e) => e.toString())
                                                  .toList());
                                          prefs.setStringList(
                                              'ccprice',
                                              price1
                                                  .map((e) => e.toString())
                                                  .toList());
                                          countprice();
                                          totalprice();
                                        });
                                      }
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                              "No Item Found",
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
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffB40300),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      "Checkout",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                )),
                          ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
