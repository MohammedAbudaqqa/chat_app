import 'package:chatapp/screens/auth_bloc/auth_bloc.dart';
import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatapp/screens/cubits/login_cubit/login_cubit.dart';
import 'package:chatapp/screens/cubits/register_cubit/register_cubit.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:chatapp/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ScholarChat());
}

class ScholarChat extends StatelessWidget {
  ScholarChat({super.key});

  @override
//////////////////////////////////////
  ///
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void initState() {
    messaging.getToken().then((value) {
      print("======================token=========================");
      print("${value}");
    });
  }

////////////////////////////////////
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        routes: {
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'ChatPage': (context) => ChatPage(),
        },
        initialRoute: 'LoginPage',
      ),
    );
  }
}
