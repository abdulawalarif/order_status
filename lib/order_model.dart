/// a dummy order model to simulate
class OrdersModel {
  final String status;
  final String createdAt;
    final String receivedDate;
  final String onTheWayDate;

  const OrdersModel({
    required this.status,
    required this.createdAt,
    required this.receivedDate,
        required this.onTheWayDate,
  });
}