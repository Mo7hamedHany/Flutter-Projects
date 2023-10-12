import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onChanged, this.obsecureText = false});
  String? hintText;
  Function(String)? onChanged;
  bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Fill the field and try again';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
