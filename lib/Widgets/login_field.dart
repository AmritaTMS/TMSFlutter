import 'package:flutter/material.dart';
import 'package:tms/constants.dart';

class LoginField extends StatelessWidget {
  final String text;
  final Widget icon;
  final bool isHidden;
  final Function(String) changeVal;
  final String? Function(String?) valid;
  LoginField(this.text, this.icon, this.isHidden, this.changeVal, this.valid);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kCastelon,
      onChanged: changeVal,
      decoration: InputDecoration(
        filled: true,
        fillColor: kGlacier,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCastelon, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kCamblue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: kCamblue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kRed, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        hintText: text,
        labelStyle: TextStyle(color: kMatte),
        suffixIcon: icon,
      ),
      validator: valid,
      obscureText: !isHidden,
    );
  }
}
