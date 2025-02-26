import 'package:flutter/material.dart';

import '../../service/service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade600,
        title: Text("Order Page",style: AppWidget.headlineTextfieldStyle(),),
      ),
    );
  }
}