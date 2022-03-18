class Photo {
  final int id;
  final String name;
  final bool favorite;

  const Photo({
    required this.id, 
    required this.name, 
    required this.favorite
    });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'favorite': favorite
    };
  }
}