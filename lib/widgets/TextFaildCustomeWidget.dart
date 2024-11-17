import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFalidCustome extends StatelessWidget{
  TextFalidCustome({
    super.key,
    required this.txtlabel,
    required this.controller,
    required this.obscuretxt,
    required this.validator
});
  String txtlabel;
  TextEditingController controller;
  bool obscuretxt;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: txtlabel
        ),
        controller: controller,
        obscureText: obscuretxt,
        validator: validator,
      ),
    );
  }
}