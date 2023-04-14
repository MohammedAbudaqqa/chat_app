import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    required this.title,
     required this.onTap,
  });
String? title;
VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
              title!,
              style: TextStyle(color: Color(0xff2B475E), fontSize: 24),
            )),
      ),
    );
  }
}
