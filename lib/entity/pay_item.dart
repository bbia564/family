class PayItem {
  int id;
  String category;
  double amount;
  String time;
  String? notes;
  String createdAt;

  PayItem(
    this.id,
    this.category,
    this.amount,
    this.time,
    this.notes,
    this.createdAt,
  );

  factory PayItem.fromJson(Map<String, dynamic> json) {
    return PayItem(json['id'], json['category'], json['amount'], json['time'], json['notes'],
        json['created_at']);
  }
}
