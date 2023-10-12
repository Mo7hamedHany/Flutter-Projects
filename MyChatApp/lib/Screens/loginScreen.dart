import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mychatapp/Screens/registerScreen.dart';
import 'package:mychatapp/widgets/button.dart';
import 'package:mychatapp/widgets/constants.dart';
import 'package:mychatapp/widgets/text_field.dart';

import '../helpers/show_snack_bar.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String? emaill;

  String? passwordd;

  String? ex;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(kLogo),
              Text(
                'Whochat',
                style: TextStyle(
                    fontSize: 32, color: Colors.white, fontFamily: 'Pacifico'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 15),
              CustomTextField(
                onChanged: (value) {
                  emaill = value;
                },
                hintText: 'Username',
              ),
              SizedBox(height: 10),
              CustomTextField(
                onChanged: (value) {
                  passwordd = value;
                },
                obsecureText: true,
                hintText: 'Password',
              ),
              SizedBox(height: 10),
              CustomButton(
                onTap: () async {
                  var auth = FirebaseAuth.instance;
                  if (formKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      await LoginUser(auth);
                      Navigator.pushNamed(context, 'chatpage',
                          arguments: emaill);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ShowSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        ShowSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      ShowSnackBar(context,
                          'There was an error in the data entry. Try Again');
                    }
                    isLoading = false;
                    setState(() {});
                  }

                  /* ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Register is done Succesfully'),
                        ),
                      );
                      */
                },
                name: 'Login',
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    'If you don\'t have an account. ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'registerPage');
                    },
                    child: Text(
                      '  Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'ListOfContacts',
                      arguments: emaill);
                },
                child: Text(
                  'test page',
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser(FirebaseAuth auth) async {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emaill!, password: passwordd!);
  }
}
