import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:chatapp/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}
class ScholarChat extends StatefulWidget {
  const ScholarChat({super.key});

  @override
  State<ScholarChat> createState() => _ScholarChatState();
}

class _ScholarChatState extends State<ScholarChat> {
  @override
//////////////////////////////////////
/// 
    FirebaseMessaging messaging = FirebaseMessaging.instance;



  void initState() {
    messaging.getToken().then((value){
      print("======================token=========================");
      print("${value}");
    });

  }
////////////////////////////////////
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      routes:{
        'LoginPage': (context) => LoginPage(),
        'RegisterPage': (context) => RegisterPage(),
        'ChatPage': (context) =>  ChatPage(),
      } ,
      initialRoute:'LoginPage' ,
    );
  }
}




