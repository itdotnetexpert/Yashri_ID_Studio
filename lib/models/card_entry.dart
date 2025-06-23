class CardEntry {
  final String name;
  final String role;
  final String number;
  final String imagePath;

  CardEntry({
    required this.name,
    required this.role,
    required this.number,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'number': number,
      'imagePath': imagePath,
    };
  }

  factory CardEntry.fromMap(Map<String, dynamic> map) {
    return CardEntry(
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      number: map['number'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}