import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'login.dart';
import 'signUp.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
   ? Login(onclickedSignUp: toggle) 
   : SignUp(onclickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}