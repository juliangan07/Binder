import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Book } from './book';
import { BookService } from './book.service';

@Component({
  selector: 'book',
  templateUrl: './app/book.component.html',
  styleUrls: ['./app/book.component.css']
  
})

export class BookComponent implements OnInit  { 
  appTitle = 'Binder';
  books: Book[];
  selectedBook: Book;

  onSelect(book: Book): void {
    this.selectedBook = book;
  }

  constructor(
    private bookService: BookService,
    private router: Router) {}

  getBooks(): void {
    this.bookService.getBooks().then(books => this.books = books);
  }

  ngOnInit(): void {
    this.getBooks();
  }

  gotoDetail(): void {
    this.router.navigate(['/booklist', this.selectedBook.id]);
  }
}
