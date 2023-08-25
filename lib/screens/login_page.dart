import 'package:chatapp/constants.dart';
import 'package:chatapp/screens/auth_bloc/auth_bloc.dart';
import 'package:chatapp/screens/chat_page.dart';
import 'package:chatapp/screens/cubits/chat_cubit/chat_cubit.dart';
// import 'package:chatapp/screens/cubits/login_cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, "ChatPage", arguments: email);
          isLoading = false;
        } else if (state is LoginLoading) {
          isLoading = false;
        } else if (state is LoginFaliuar) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        } else {
          showSnackBar(context, "something went wrong");
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Form(
                    key: formKey,
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Image.asset("assets/images/scholar.png"),
                          const Text(
                            "Scholar Chat",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'Pacifico'),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          Row(
                            children: const [
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormTextField(
                            booll: false,
                            onChanged: (value) {
                              email = value;
                            },
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomFormTextField(
                            booll: true,
                            onChanged: (value) {
                              password = value;
                            },
                            hintText: 'Password',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                      LoginEvent(
                                          email: email!, password: password!));
                                }
                              },
                              title: 'Login'),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account ? ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'RegisterPage');
                                },
                                child: const Text(
                                  " Sign Up",
                                  style: TextStyle(color: Color(0xffC7EDE6)),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 3,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//   Future<void> loginUser() async {
//     UserCredential user = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email!, password: password!);
//   }
}
