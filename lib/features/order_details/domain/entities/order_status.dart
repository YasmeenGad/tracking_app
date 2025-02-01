import 'dart:ui';

class OrderStatus {
  final int step;
  final String name;
  final VoidCallback action;

  OrderStatus({
    required this.step,
    required this.name,
    required this.action,
  });

  void triggerAction() {
    action();
  }
}
