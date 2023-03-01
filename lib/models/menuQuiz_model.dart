// ignore_for_file: public_member_api_docs, sort_constructors_first
class Menu {
  final String name;
  final int total;
  final String image;
  Menu({
    required this.name,
    required this.total,
    required this.image,
  });

  @override
  String toString() => 'Menu(name: $name, total: $total, image: $image)';
}
