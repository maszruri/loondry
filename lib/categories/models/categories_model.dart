class CategoriesModel {
  int? id;
  String? name;
  int? price;
  int? minimumWeight;
  int? duration;

  CategoriesModel(
      {this.id, this.name, this.price, this.minimumWeight, this.duration});

  CategoriesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    price = map['price'];
    minimumWeight = map['minimumWeight'];
    duration = map['duration'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['minimumWeight'] = minimumWeight;
    data['duration'] = duration;
    return data;
  }
}
