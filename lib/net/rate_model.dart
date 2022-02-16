class Rate {
  int? id;
  int? userId;
  String? phoneNumber;
  int? rate;
  String? created;

  Rate({
    this.id,
    this.userId,
    this.phoneNumber,
    this.rate,
    this.created,
  });

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    phoneNumber = json['phoneNumber'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['phoneNumber'] = phoneNumber;
    data['rate'] = rate;
    return data;
  }

  @override
  toString() => toJson().toString();
}
