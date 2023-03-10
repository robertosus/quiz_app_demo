// ignore_for_file: public_member_api_docs, sort_constructors_first
class Menu {
  final int id;
  final String name;
  final String image;
  final int total;
  Menu({
    required this.id,
    required this.name,
    required this.total,
    required this.image,
  });

  Menu.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        total = json['total'];

  @override
  String toString() {
    return 'Menu(id: $id, name: $name, image: $image, total: $total)';
  }
}
