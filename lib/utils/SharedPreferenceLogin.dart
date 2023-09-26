import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLogin {
  Future<List<dynamic>> getemailList() async {
    final prefs = await SharedPreferences.getInstance();
    final emailList = prefs.getStringList('email1') ?? [];
    return emailList;
  }

  Future<List<dynamic>> getpassList() async {
    final prefs = await SharedPreferences.getInstance();
    final passList = prefs.getStringList('password1') ?? [];
    return passList;
  }

  Future<List<dynamic>> getnameList() async {
    final prefs = await SharedPreferences.getInstance();
    final nameList = prefs.getStringList('name1') ?? [];
    return nameList;
  }

  Future<List<dynamic>> getimageList() async {
    final prefs = await SharedPreferences.getInstance();
    final imageList = prefs.getStringList('ccimage') ?? [];
    return imageList;
  }

  Future<List<dynamic>> getnammeList() async {
    final prefs = await SharedPreferences.getInstance();
    final nameList = prefs.getStringList('ccname') ?? [];
    return nameList;
  }

  Future<List<dynamic>> getpriceList() async {
    final prefs = await SharedPreferences.getInstance();
    final priceList = prefs.getStringList('ccprice') ?? [];
    return priceList;
  }
}
