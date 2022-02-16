class Rate {
  final int? nurseId;
  final String? phoneNumber;
  final int? rate;
  Rate({required this.nurseId, required this.phoneNumber, required this.rate});
  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      nurseId: json['nurse'],
      phoneNumber: json['phoneNumber'],
      rate: json['rate'],
    );
  }
}
