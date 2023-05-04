enum SortingTypes {
  nameAscending(type: 'name'),
  nameDescending(type: '-name'),

  modifiedAscending(type: 'modified'),
  modifiedDescending(type: '-modified');

  const SortingTypes({required this.type});

  final String type;
}
