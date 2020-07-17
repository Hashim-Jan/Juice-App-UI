import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
 final onChange;
 CustomTextField({this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
