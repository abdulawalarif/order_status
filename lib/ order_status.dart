import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_status/order_model.dart';
import 'package:order_status/order_status_card.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(DateTime.now());
    return _buildOrderStatusScreen(
        context: context,
        order: const OrdersModel(
          status: 'Delivered',
          createdAt: '2025-01-14 12:47:27.447780',
          receivedDate: '2025-01-15 12:47:27.447780',
          onTheWayDate: '2025-01-16 12:47:27.447780',
        ));
  }
}

Widget _buildOrderStatusScreen(
    {required BuildContext context, required OrdersModel order}) {
  final theme = Theme.of(context);
  final bool isDarkTheme = theme.brightness == Brightness.dark;

  final isPending = order.status == 'Pending';
  final isReceived = order.status == 'Received' ||
      order.status == 'Confirmed' ||
      order.status == 'Delivered';
  final isOnTheWay = order.status == 'Confirmed' || order.status == 'Delivered';
  final isDelivered = order.status == 'Delivered';

  return Scaffold(
    appBar: AppBar(
      title: Text('Order Status', style: theme.textTheme.titleSmall),
    ),
    body: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: ColorFiltered(
            colorFilter: isDarkTheme
                ? const ColorFilter.mode(Colors.black54, BlendMode.darken)
                : const ColorFilter.mode(
                    Colors.transparent, BlendMode.multiply),
            child: Image.asset(
              'assets/order.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 4),
              const SizedBox(height: 16),
              OrderStatusCard(
                title: 'Order Pending',
                time: order.createdAt.formattedDate(),
                isCompleted: !isPending && isReceived || isPending,
              ),
              OrderStatusCard(
                title: 'Order Received',
                time: isReceived ? order.createdAt.formattedDate() : '...',
                isCompleted: isReceived,
              ),
              OrderStatusCard(
                title: 'On The Way',
                time: !isOnTheWay ? '...' : order.onTheWayDate.formattedDate(),
                isCompleted: isOnTheWay,
                showTracking: !isDelivered && isOnTheWay,
              ),
              OrderStatusCard(
                title: 'Delivered',
                isCompleted: isDelivered,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 200,
                child: Material(
                  color: theme.primaryColor,
                  child: InkWell(
                    onTap: isDelivered
                        ? () async {
                            ///perform the operation you want upon order confirmation by users
                          }
                        : null,
                    child: Center(
                      child: Text(
                        'Confirm Delivery',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: isDelivered
                              ? Colors.white
                              : theme.unselectedWidgetColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    ),
  );
}

extension on String {
  String formattedDate() {
    try {
      DateTime dateTime = DateTime.parse(this);
      return DateFormat('MMMM d, y').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }
}
