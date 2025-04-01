import 'dart:ffi';

class ChatMessageEntity {
  final String id;
  final String text;
  final String? imageUrl;
  final DateTime createdAt;
  final Author author;

  ChatMessageEntity({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.author,
    this.imageUrl,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      id: json['id'],
      text: json['text'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      author: Author.fromJson(json['author']),
      imageUrl: json['image'],
    );
  }
}

class Author {
  final String username;

  Author({required this.username});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(username: json['username'] as String);
  }
}
