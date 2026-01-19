import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/auth_service.dart';
import 'package:grocery_app/utils/text_styles.dart';

import '../nav-bar/nav_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passController =TextEditingController();
  final AuthService _authService=AuthService();
  bool _isLoading = false;

  @override
  void dispose(){
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Future<void> onSubmit(String email, String password) async{
    if(_isLoading) return;

    setState(() {
      _isLoading =true;
    });

    try{
      final user=await _authService.signUp(
          email: email,
          password: password);
      if(user!=null && mounted){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => const NavBarPage()));
      }
    }on FirebaseAuthException catch(e){
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())
        ),
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
                    controller: _passController,
                    obscureText: true,
                  ),

                  const SizedBox(height:10),
                  //Elevated button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: (){

                      },
                      child: Text("Register",
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
