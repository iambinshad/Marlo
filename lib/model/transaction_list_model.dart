class AllTransactionModel {
  final String? id;
  final String? amount;
  final String? status;
  final String? sourceId;
  final String? sourceType;
  final String? transactionType;
  final String? currency;
  final DateTime? createdAt;
  final int? fee;
  final String? description;
  final DateTime? settledAt;
  final DateTime? estimatedSettledAt;
  final String? currency1;

  AllTransactionModel({
     this.id,
     this.amount,
     this.status,
     this.sourceId,
     this.sourceType,
     this.transactionType,
     this.currency,
     this.createdAt,
     this.fee,
     this.description,
     this.settledAt,
     this.estimatedSettledAt,
     this.currency1,
  });

  factory AllTransactionModel.fromJson(Map<String, dynamic> json) {
    return AllTransactionModel(
      id: json['id'],
      amount: json['amount'],
      status: json['status'],
      sourceId: json['sourceId'],
      sourceType: json['sourceType'],
      transactionType: json['transactionType'],
      currency: json['currency'],
      createdAt: DateTime.parse(json['createdAt']),
      fee: json['fee'],
      description: json['description'],
      settledAt: json['settledAt'] != null ? DateTime.parse(json['settledAt']) : null,
      estimatedSettledAt: DateTime.parse(json['estimatedSettledAt']),
      currency1: json['currency1'],
    );
  }
}

// List of transactions
List<AllTransactionModel> transactionsFromJson(List<dynamic> json) {
  return json.map((data) => AllTransactionModel.fromJson(data)).toList();
}
