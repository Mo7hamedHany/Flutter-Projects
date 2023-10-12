import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mychatapp/widgets/button.dart';
import 'package:mychatapp/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helpers/show_snack_bar.dart';

class registerScreen extends StatefulWidget {
  registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String? email;

  String? password;

  String? ex;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/scholar.png'),
                Text(
                  'Whochat',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 32, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
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
                        await RegisterUser(auth);
                        Navigator.pushNamed(context, 'chatpage');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ShowSnackBar(context, 'Weak Password');
                        } else if (e.code == 'email-already-in-use') {
                          ShowSnackBar(context,
                              'The account already exists for that email.');
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
                  name: 'Register',
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Already Have an Account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Login',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> RegisterUser(FirebaseAuth auth) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
