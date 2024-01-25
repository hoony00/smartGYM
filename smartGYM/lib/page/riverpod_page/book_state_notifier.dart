
import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksProvider = StateNotifierProvider<BookStateNotifier, List<Book>>((ref) {
  return BookStateNotifier();
});


class BookStateNotifier extends StateNotifier<List<Book>> {
  BookStateNotifier() : super([]);

  void addBook(Book newBook) {
    state = [...state, newBook];
  }

  void removeBook(Book removeBook) {
    state = state.where((book) => book != removeBook).toList();
  }
}


class Book {
  final String title;
  final String description;

  Book({required this.title, required this.description});
}