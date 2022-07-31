/// This file is used by 'Search in ListView_002'
class Book {
  final int id;
  final String title;
  final String author;
  final String urlImage;

  const Book({
    required this.id,
    required this.author,
    required this.title,
    required this.urlImage,
  });

  /// A method to change from Json object to Model objects
  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  /// A method to change Model objects to Json object
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'urlImage': urlImage,
      };
}
