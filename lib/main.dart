import 'package:flutter/material.dart';

void main() {
  runApp(OrderStatusApp());
}

class OrderStatusApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'ORDER STATUS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Colors.yellow, thickness: 2),
          SizedBox(height: 16),
          OrderStatusStep(
            title: 'Order Received',
            time: '8:30 am, Jan 31, 2017',
            isCompleted: true,
          ),
          OrderStatusStep(
            title: 'On The Way',
            time: '10:23 am, Jan 31, 2017',
            isCompleted: true,
            showTracking: true,
          ),
          OrderStatusStep(
            title: 'Delivered',
            isCompleted: false,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            ),
            child: Text(
              'Confirm Delivery',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(height: 20),
          // Wrap Image in a SizedBox with full width and set fit
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/order.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
  }
}


class OrderStatusStep extends StatelessWidget {
  final String title;
  final String? time;
  final bool isCompleted;
  final bool showTracking;

  OrderStatusStep({
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
        SizedBox(width: 8),
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
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    if (showTracking)
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
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
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
