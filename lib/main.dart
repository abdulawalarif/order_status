import 'package:flutter/material.dart';

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
                child:   Center(
                  child: Text(
                    'Confirm Delivery',
                    style: TextStyle(
                      color: isDelivered? Colors.white: Colors.white10,
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

class OrderStatusStep extends StatelessWidget {
  final String title;
  final String? time;
  final bool isCompleted;
  final bool showTracking;

  const OrderStatusStep({
    super.key,
    required this.title,
    this.time,
    required this.isCompleted,
    this.showTracking = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.redAccent : Colors.grey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
              if (time != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time!,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    if (showTracking)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Tracking',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
