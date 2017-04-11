import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { Book } from './book';
import { BookService } from './book.service';

@Component({
  selector: 'upload',
  templateUrl: './app/upload.module.html',
  styles: []
  
})

export class UploadModule implements OnInit  { 
    appTitle = 'Binder';
    books: Book[];
    selectedBook: Book;

    constructor(
    private bookService: BookService,
    private router: Router) {}

    getBooks(): void {
    this.bookService.getBooks().then(books => this.books = books);
  }

    ngOnInit(): void {
    this.getBooks();
  }

    add(title: string, author: string, isbn: string, description: string, 
        classUse: string, condition: string, seller: string, price: string, img: string, date: string): void {
        
        title = title.trim();
        author = author.trim();
        isbn = isbn.trim();
        description = description.trim();
        seller = seller.trim();
        price = price.trim();
        img = img.trim();
        classUse = classUse.trim();
        date = date.trim();
        condition = condition.trim();

        if (!title) { return; }
        this.bookService.create(title, author, isbn, description, classUse, condition, seller, price, img, date).then(book => {
        this.books.push(book);
        this.selectedBook = null;
      });
  }
}