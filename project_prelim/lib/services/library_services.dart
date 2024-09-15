import 'package:project_prelim/models/book.dart';

class BookService {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  Book? getBookById(String id) {
  final result = _books.where((book) => book.id == id);
  return result.isEmpty ? null : result.first;
}

  List<Book> searchBooks(String query) {
    return _books.where((book) => book.title.contains(query) || book.author.contains(query)).toList();
  }

  void deleteBook(String id) {
    _books.removeWhere((book) => book.id == id);
  }

  List<Book> getAllBooks() {
    return _books;
  }
}