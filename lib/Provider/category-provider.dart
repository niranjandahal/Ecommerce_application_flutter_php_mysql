import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:r11seproject/routes/routes.dart';
import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  var showcatdata;
  var showsellerdata;
  var catdata;
  var catkeys;
  var sellerdata;
  var sellerkeys;
  var alldata;

  Future<void> fetchProductCategory() async {
    var url = Uri.parse(displayproducturl);
    var response = await http.post(url, body: {
      'b': 'b',
    });

    catdata = json.decode(response.body);
    catkeys = catdata.keys.toList();
    notifyListeners(); // Notify listeners of the state change
  }

  Future<void> fetchsellerCategory() async {
    var url = Uri.parse(displayproducturl);
    var response = await http.post(url, body: {
      'a': 'a',
    });

    sellerdata = json.decode(response.body);
    sellerkeys = sellerdata.keys.toList();
    notifyListeners(); // Notify listeners of the state change
  }

  Future<void> fetchAllCategory() async {
    var url = Uri.parse(displayproducturl);
    var response = await http.post(url, body: {
      'c': 'c',
    });

    alldata = json.decode(response.body);
    notifyListeners(); // Notify listeners of the state change
  }

  void ShowCatData(String categorykey) {
    showcatdata = catdata[categorykey];
    notifyListeners(); // Notify listeners of the state change
  }

  void ShowSellerData(String sellerkey) {
    showsellerdata = sellerdata[sellerkey];
  }

  Future<void> refreshall() async {
    await fetchProductCategory();
    await fetchsellerCategory();
    await fetchAllCategory();
    ShowCatData(catkeys[0]);
  }
}
