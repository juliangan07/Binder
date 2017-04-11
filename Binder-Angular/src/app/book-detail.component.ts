import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Location } from '@angular/common';

import { Book } from './book';
import { BookService } from './book.service';
import 'rxjs/add/operator/switchMap';

@Component({
  selector: 'book-detail',
  templateUrl: './app/book-detail.component.html',
  styleUrls: [ './app/book-detail.component.css'],
})

export class BookDetailComponent implements OnInit {
    book: Book;

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

    
}
