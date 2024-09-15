import 'dart:io';
import 'package:project_prelim/models/book.dart';
import 'package:project_prelim/services/library_services.dart';

void main() {
  final bookService = BookService();

  while (true) {
    print('Library Management System:');
    print('1. Add Book');
    print('2. Search Book');
    print('3. Delete Book');
    print('4. List Books');
    print('5. Exit');
    stdout.write('Choose an option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter Book ID: ');
        final id = stdin.readLineSync()!;
        stdout.write('Enter Book Title: ');
        final title = stdin.readLineSync()!;
        stdout.write('Enter Book Author: ');
        final author = stdin.readLineSync()!;
        bookService.addBook(Book(id: id, title: title, author: author));
        print('Book added successfully!');
        break;

      case '2':
        stdout.write('Enter Book ID to search: ');
        final id = stdin.readLineSync()!;
        final book = bookService.getBookById(id);
        if (book != null) {
          print('Book Found: ${book.title} by ${book.author}');
        } else {
          print('Book not found');
        }
        break;

      case '3':
        stdout.write('Enter Book ID to delete: ');
        final id = stdin.readLineSync()!;
        bookService.deleteBook(id);
        print('Book deleted successfully!');
        break;

      case '4':
        final books = bookService.getAllBooks();
        if (books.isEmpty) {
          print('No books in the library.');
        } else {
          print('Books in Library:');
          for (var book in books) {
            print('${book.id}: ${book.title} by ${book.author}');
          }
        }
        break;

      case '5':
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}