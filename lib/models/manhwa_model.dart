class Manhwa {
  final String id;
  final String title;
  final String? description;
  final String? coverUrl;

  Manhwa({
    required this.id,
    required this.title,
    this.description,
    this.coverUrl,
  });

  factory Manhwa.fromJson(Map<String, dynamic> json) {
    return Manhwa(
      id: json['id'] ?? '',
      title: json['attributes']?['title']?['en'] ?? 
             json['attributes']?['title'] ?? 
             'Unknown Title',
      description: json['attributes']?['description']?['en'],
      coverUrl: json['attributes']?['coverArt'],
    );
  }
}

class Chapter {
  final String id;
  final String chapterNumber;
  final String? title;

  Chapter({
    required this.id,
    required this.chapterNumber,
    this.title,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] ?? '',
      chapterNumber: json['attributes']?['chapter'] ?? 'Unknown',
      title: json['attributes']?['title'],
    );
  }
}