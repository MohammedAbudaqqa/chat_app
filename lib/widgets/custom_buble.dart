import 'package:chatapp/models/massage.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBuble extends StatelessWidget {
   ChatBuble({
    required this.massageins,
  }) ;
   Massage massageins;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Text(
          massageins.massage,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatBubleTwo extends StatelessWidget {
  ChatBubleTwo({
    required this.massageins,
  }) ;
  Massage massageins;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Text(
          massageins.massage,
          style:TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

