class SlotEntity {
  final String vehicleModel;
  final String connectionType;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final int price;

  SlotEntity({
    required this.vehicleModel,
    required this.connectionType,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.price,
  });
}
