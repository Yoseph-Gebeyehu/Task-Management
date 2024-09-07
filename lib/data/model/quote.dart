class Quote {
  final String? id;
  final String? content;
  final String? author;
  final List<String>? tags;
  final String? authorSlug;
  final int? length;
  final DateTime? dateAdded;
  final DateTime? dateModified;

  Quote({
    this.id,
    this.content,
    this.author,
    this.tags,
    this.authorSlug,
    this.length,
    this.dateAdded,
    this.dateModified,
  });

  // Factory constructor to create a Quotes instance from JSON
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['_id'] as String,
      content: json['content'] as String,
      author: json['author'] as String,
      tags: List<String>.from(json['tags']),
      authorSlug: json['authorSlug'] as String,
      length: json['length'] as int,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      dateModified: DateTime.parse(json['dateModified'] as String),
    );
  }

  // Method to convert a Quotes instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'content': content,
      'author': author,
      'tags': tags,
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded?.toIso8601String(),
      'dateModified': dateModified?.toIso8601String(),
    };
  }
}
