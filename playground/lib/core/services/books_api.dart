/// This file is used by 'Search in ListView_002'
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:playground/core/model/book.dart';

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/Edamijueda/d2f021622cdae8be6f2a016d482c97fb/raw/26ac615cf953f8e6745d258d8a1fb0477fb7b371/books.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
