import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({required this.hintText, required this.onChanged,required this.booll});
  String? hintText;
  Function(String)? onChanged;
  bool booll = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value!.isEmpty){
          return 'Field is required';
        }
      },
      obscureText: booll,
      style:const TextStyle(color: Colors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle:const TextStyle(color: Colors.white),
          enabledBorder:
             const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border:
           const   OutlineInputBorder(borderSide: BorderSide(color: Colors.white))),
    );
  }
}
