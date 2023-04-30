enum RoutesEmum {
  home(name: 'home', path: '/home');

  const RoutesEmum({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}
