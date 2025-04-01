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
}

class Author {
  final String username;

  Author({required this.username});
}
