import 'dart:async';
import 'dart:ui';

import 'package:playground/core/data/book_data.dart';
import 'package:playground/core/model/book.dart';
import 'package:playground/core/services/books_api.dart';
import 'package:stacked/stacked.dart';

class SearchInListViewModel extends IndexTrackingViewModel {
  Timer? debouncer;
  List<Book> _books = offlineBooks;
  String _query = '';

  get books => _books;

  get query => _query;

  void searchOfflineBook(query) {
    final books = offlineBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    _query = query;
    _books = books;
    notifyListeners();
  }

  Future searchOnlineBook(query) async => debounce(() async {
        final books = await BooksApi.getBooks(query);
        _query = query;
        _books = books;
        notifyListeners();
      });

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  // In other not to put much pressure on our sever, we use debounce, this
  // allow us to wait one second after the user as finish typing in TextField.
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) debouncer!.cancel();
    debouncer = Timer(duration, callback);
  }
}
