import 'package:flutter/material.dart';

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
