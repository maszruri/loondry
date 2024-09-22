class CustomerModel {
  int? id;
  String? name;
  String? phone;
  String? address;

  CustomerModel({this.id, this.name, this.phone, this.address});

  CustomerModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phone'];
    address = map['address'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    return data;
  }
}
