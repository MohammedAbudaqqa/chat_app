import 'package:chatapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
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
                              style: TextStyle(fontSize: 24, color: Colors.white),
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
                              if(formKey.currentState!.validate()){
                                isLoading = true;
                                try {
                                  await loginUser();
                                  //ضفنا الايميل عشان نقدر نصل اله بصفحة الشات
                                  Navigator.pushNamed(context, "ChatPage",arguments: email);

                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showSnackBar(
                                        context, 'No user found for that email');
                                    print("No user found for that email");
                                  } else if (e.code == 'wrong-password') {
                                    showSnackBar(context,
                                        'Wrong password provided for that user');
                                    print('Wrong password provided for that user');
                                  }
                                }catch (e) {
                                  showSnackBar(context, 'Error');
                                  print(e);
                                }
                                isLoading = false;
                                setState(() {

                                });
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
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'RegisterPage');
                              },
                              child:const Text(
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
    );
  }


  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
