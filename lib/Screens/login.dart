import 'dart:ui' as Size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth_email/main.dart';
//import 'package:firebase_auth_email/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  final VoidCallback onclickedSignUp;

  const Login({
    Key? key,
    required this.onclickedSignUp,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordCOntroller = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordCOntroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: emailController,
                cursorColor: Colors.cyan,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: passwordCOntroller,
                cursorColor: Colors.cyan,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //minimumSize: 
                ),
                icon: Icon(Icons.lock_open, size: 32),
                label: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn,
              ),
            ),
            SizedBox(height: 25),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20
                ),
                text: 'No Account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                    ..onTap = widget.onclickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.secondary
                    )
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordCOntroller.text.trim()
    );
  }
}