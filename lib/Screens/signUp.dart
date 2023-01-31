import 'dart:ui' as Size;

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  final VoidCallback onclickedSignIn;

  const SignUp({
    Key? key,
    required this.onclickedSignIn,
  }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          "SignUp"
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
                icon: Icon(Icons.arrow_forward, size: 32),
                label: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signUp,
              ),
            ),
            SizedBox(height: 25),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20
                ),
                text: 'Already have account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                    ..onTap = widget.onclickedSignIn,
                    text: 'Log in',
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

  Future signUp() async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordCOntroller.text.trim()
      );
    } on FirebaseAuthException catch (e){
      print(e);
    }
  }
}