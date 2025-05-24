class ChatMessageEntity {
  final String id;
  final String text;
  final String? imageUrl;
  final DateTime createdAt;
  final Author author;
  String? image64base;

  ChatMessageEntity({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.author,
    this.imageUrl,
    this.image64base,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      author: Author.fromJson(json['author']),
      imageUrl: json['image'],
      image64base: json['image64base'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'author': author.toJson(),
      'image': imageUrl,
      'image64base': image64base,
    };
  }
}

class Author {
  final String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'username': username};
  }
}
