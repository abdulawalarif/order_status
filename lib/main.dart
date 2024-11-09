import 'package:flutter/material.dart';
import 'order_status_card.dart';

void main() {
  runApp(const OrderStatusApp());
}

class OrderStatusApp extends StatelessWidget {
  const OrderStatusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: OrderStatusCard(),
        ),
      ),
    );
  }
}
