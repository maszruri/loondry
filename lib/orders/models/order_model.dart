class OrderModel {
  int? id;
  String? customerName;
  String? customerPhone;
  String? categoriesName;
  int? categoriesPrice;
  int? categoriesDuration;
  num? weight;
  int? totalPrice;
  String? startedAt;
  String? finisedAt;

  OrderModel(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.categoriesName,
      this.categoriesPrice,
      this.categoriesDuration,
      this.weight,
      this.totalPrice,
      this.startedAt,
      this.finisedAt});

  OrderModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    customerName = map['customerName'];
    customerPhone = map['customerPhone'];
    categoriesName = map['categoriesName'];
    categoriesPrice = map['categoriesPrice'];
    categoriesDuration = map['categoriesDuration'];
    weight = map['weight'];
    totalPrice = map['totalPrice'];
    startedAt = map['startedAt'];
    finisedAt = map['finisedAt'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['categoriesName'] = categoriesName;
    data['categoriesPrice'] = categoriesPrice;
    data['categoriesDuration'] = categoriesDuration;
    data['weight'] = weight;
    data['totalPrice'] = totalPrice;
    data['startedAt'] = startedAt;
    data['finisedAt'] = finisedAt;
    return data;
  }
}
