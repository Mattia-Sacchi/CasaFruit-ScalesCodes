

class ScaleCode {
  final int id;
  final String name;
  final String description;

  const ScaleCode({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'ScaleCode{id: $id, name: $name, description: $description}';
  }

}