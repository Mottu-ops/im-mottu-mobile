enum RoutesEmum {
  home(name: 'home', path: '/home'),
  details(name: 'details', path: '/details');

  const RoutesEmum({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
