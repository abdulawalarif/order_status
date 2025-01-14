import 'package:flutter/material.dart';
import 'package:order_status/%20order_status.dart';

void main() {
  runApp(const OrderStatusApp());
}

class OrderStatusApp extends StatelessWidget {
  const OrderStatusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: OrderStatus(),
        ),
      ),
    );
  }
}
