import 'package:chatapp/screens/cubits/register_cubit/register_cubit.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is RegisterSuccess) {
          Navigator.pushNamed(context, "ChatPage");
          isLoading = false;
        } else if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFaliuar) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        } else {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
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
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
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
                              BlocProvider.of<RegisterCubit>(context)
                                  .stream
                                  .listen((event) {
                                print(event);
                              }).cancel();

                              BlocProvider.of<RegisterCubit>(context)
                                  .registerUser(
                                      email: email!, password: password!);
                            }
                          },
                          title: 'Sign Up',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an "
                              "account ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " Login",
                                style: TextStyle(color: Color(0xffC7EDE6)),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<void> registerUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!);
  // }
}
