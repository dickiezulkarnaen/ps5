class UserModel {
  String? pob;
  Address? address;
  String? dob;
  String? userName;
  String? name;
  String? email;

  UserModel(
      {this.pob, this.address, this.dob, this.userName, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    pob = json['pob'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    dob = json['dob'];
    userName = json['user_name'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pob'] = pob;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['dob'] = dob;
    data['user_name'] = userName;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Address {
  String? country;
  String? province;
  String? city;
  String? subDistrict;
  String? street;

  Address(
      {this.country, this.province, this.city, this.subDistrict, this.street});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    province = json['province'];
    city = json['city'];
    subDistrict = json['sub_district'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['sub_district'] = subDistrict;
    data['street'] = street;
    return data;
  }
}

