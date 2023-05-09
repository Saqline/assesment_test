import 'dart:convert';

import 'package:assesment_test/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  bool _isLoaded = false;
  get isloaded => _isLoaded;

  Future<DataModel?> getData() async {
    var response = await http
        .get(Uri.parse('https://admin.cashsmarts.co.uk/api/provider'));

    if (response.statusCode == 200) {
      var json = response.body;

      return dataModelFromJson(json);
    }
  }
}
