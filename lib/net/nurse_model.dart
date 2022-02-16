class Nurse {
  int? id;
  int? userId;
  String? firstName;
  String? lastName;
  int? age;
  String? gender;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  String? state;
  String? city;
  int? workExperience;
  String? workCondition;
  int? rate;
  String? created;

  Nurse({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.age,
    this.gender,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.state,
    this.city,
    this.workExperience,
    this.workCondition,
    this.rate,
    this.created,
  });

  Nurse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    state = json['state'];
    city = json['city'];
    workExperience = json['workExperience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['imageUrl'] = imageUrl;
    data['state'] = state;
    data['city'] = city;
    data['workExperience'] = workExperience;
    return data;
  }

  @override
  toString() => toJson().toString();
}
