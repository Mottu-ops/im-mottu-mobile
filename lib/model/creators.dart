class Creators{
  Creators({this.name});
  String? name;
  factory Creators.fromJson(Map<String, dynamic> json) {
    return Creators(
        name: json['name']
    );
  }
}