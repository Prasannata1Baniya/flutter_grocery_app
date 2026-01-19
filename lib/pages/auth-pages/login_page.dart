import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/auth_service.dart';
import 'package:grocery_app/pages/nav-bar/nav_bar.dart';
import 'package:grocery_app/utils/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passController =TextEditingController();
   bool _isLoading =true;
   final AuthService _authService= AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Future<void> onSubmit(String email, String password) async {
    if (_isLoading) return;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter email and password'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _authService.signIn(email: email,
        password: password,
      );
      if (user != null && mounted) {
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => const NavBarPage()));
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()),
              backgroundColor: Colors.red),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: ClipRRect(
          borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  //email controller
                  TextFormField(
                    controller: _emailController,
                  ),

                  const SizedBox(height:10),

                  //password controller
                  TextFormField(
                    controller: _emailController,
                    obscureText: true,
                  ),

                  const SizedBox(height:10),
                  //Elevated button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: _isLoading ? null :() {
                        onSubmit(
                            _emailController.text.toString(),
                            _passController.text.toString()
                        );
                      },
                      child: Text("Login",
                        style: TextStyles.whiteTextfieldStyle(),)
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
