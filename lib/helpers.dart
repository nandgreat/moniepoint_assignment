
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


String? validatePhoneInput(String email) {
  if (email.isEmpty) return "Phone number is required";

  if (email.length != 11) {
    return "Enter a valid phone number";
  }
  return null;
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

