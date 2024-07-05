import 'package:equatable/equatable.dart';
import 'package:mottu_marvel/app/domain/entities/comic_entity.dart';

class ComicModel extends Equatable {
  final int? available;
  final String? collectionURI;
  final List<ComicItemModel>? items;
  final int? returned;

  const ComicModel({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  ComicEntity toEntity() => ComicEntity(
        available: available,
        collectionURI: collectionURI,
        items: items?.map((item) => item.toEntity()).toList(),
        returned: returned,
      );

  ComicModel fromJson(Map<String, dynamic> json) {
    final items = <ComicItemModel>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(const ComicItemModel().fromJson(v));
      });
    }

    return ComicModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: items,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }

  @override
  List<Object?> get props => [available, collectionURI, items, returned];
}

class ComicItemModel extends Equatable {
  final String? resourceURI;
  final String? name;

  const ComicItemModel({this.resourceURI, this.name});

  ComicItemEntity toEntity() => ComicItemEntity(
        resourceURI: resourceURI,
        name: name,
      );

  ComicItemModel fromJson(Map<String, dynamic> json) {
    return ComicItemModel(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [resourceURI, name];
}
