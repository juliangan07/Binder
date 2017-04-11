import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Location } from '@angular/common';

import { Book } from './book';
import { BookService } from './book.service';
import 'rxjs/add/operator/switchMap';

@Component({
  selector: 'book-detail',
  templateUrl: './app/update.module.html',
})

export class UpdateModule implements OnInit {
    book: Book;
    books: Book[];
    selectedBook: Book;

    constructor(
      private bookService: BookService,
      private route: ActivatedRoute,
      private location: Location
    ) {}

    ngOnInit(): void {
      this.route.params
      .switchMap((params: Params) => this.bookService.getBook(+params['id']))
      .subscribe(book => this.book = book);
    }

    goBack(): void {
      this.location.back();
    }

    update(): void {
        this.bookService.update(this.book);
        // .then(()=> this.goBack());
    }

    delete(book: Book): void {
      this.bookService.delete(book.id).then(() => {
        this.books = this.books.filter(b => b !== book);

        if(this.selectedBook === book) {
          this.selectedBook = null;
        }
      });
    }
}
