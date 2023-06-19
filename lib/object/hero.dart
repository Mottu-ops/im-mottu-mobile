class Hero {
  late int id;
  late String name;
  late String description;
  late DateTime? modified;
  late String smallThumbnail;
  late String largeThumbnail;
  late List comics;
  late List series;
  late List related;

  Hero({this.id = 0, this.name = '', this.description = '', this.modified, this.smallThumbnail = '', this.largeThumbnail = '', required this.comics, required this.series, required this.related});
}