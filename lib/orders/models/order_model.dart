class OrderModel {
  int? id;
  String? customerName;
  int? customerPhone;
  String? dateCreated;
  String? timeCreated;
  String? category;
  String? estimatedCompletionDate;

  OrderModel(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.dateCreated,
      this.timeCreated,
      this.category,
      this.estimatedCompletionDate});

  OrderModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    customerName = map['customerName'];
    customerPhone = map['customerPhone'];
    dateCreated = map['dateCreated'];
    timeCreated = map['timeCreated'];
    category = map['category'];
    estimatedCompletionDate = map['estimatedCompletionDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['dateCreated'] = dateCreated;
    data['timeCreated'] = timeCreated;
    data['category'] = category;
    data['estimatedCompletionDate'] = estimatedCompletionDate;
    return data;
  }
}
