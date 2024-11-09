import 'package:flutter/material.dart';

import ' order_status_step.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key});
  final bool isDelivered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'ORDER STATUS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(color: Colors.yellow, thickness: 2),
          const SizedBox(height: 16),
          const OrderStatusStep(
            title: 'Order Received',
            time: '8:30 am, Jan 31, 2017',
            isCompleted: true,
          ),
          const OrderStatusStep(
            title: 'On The Way',
            time: '10:23 am, Jan 31, 2017',
            isCompleted: true,
            showTracking: true,
          ),
          OrderStatusStep(
            title: 'Delivered',
            isCompleted: isDelivered,
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 200,
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: isDelivered
                    ? () {}
                    : () {
                        // sending received status to datbase for this oeder
                      },
                child: Center(
                  child: Text(
                    'Confirm Delivery',
                    style: TextStyle(
                      color: isDelivered ? Colors.white : Colors.white10,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.asset(
              'assets/order.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
