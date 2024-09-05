class Thumb {
  String? path;
  String? extension;

  Thumb({required this.path, this.extension});

  Thumb.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = this.path;
    data['extension'] = this.extension;
    return data;
  }
}