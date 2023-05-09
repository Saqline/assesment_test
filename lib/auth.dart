import 'dart:convert';

import 'package:assesment_test/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class auth {
  
  static   authentic(email,password) async {
   

    final response = await http.post(
      Uri.parse('https://admin.cashsmarts.co.uk/api/consumer/login'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    return response;
  }
}
