import 'package:christianmarvelapi/data/models/items.dart';

class Comics {
  int? available;
  String? collectionURI;
  List<Items>? items;
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    items = (json['items'] as List<dynamic>?)?.map(
      (item) => Items.fromJson(item as Map<String, dynamic>)).toList() ?? [];
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = <String, dynamic>{};
       data['available'] = this.available;
      data['collectionURI'] = this.collectionURI;
      data['items'] = items!.map((item) => item.toJson()).toList();
      data['returned'] = returned;

      return data; 
  }
}