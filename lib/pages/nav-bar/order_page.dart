import 'package:flutter/material.dart';
import '../../service/service.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

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