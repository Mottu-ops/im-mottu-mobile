class Prices {
  Prices({this.type, this.price});
  String? type;
  num? price;
  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
        type: json['type'],
        price: json['price']
    );
  }
}