import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Book } from './book';

@Injectable()

export class BookService {
    private booksUrl = 'api/books'; //URL to web api

    constructor(private http: Http) {}
    
    getBooks(): Promise<Book[]> {
        return this.http.get(this.booksUrl)
            .toPromise()
            .then(response => response.json().data as Book[])
            .catch(this.handleError);
    } 

    private handleError(error: any): Promise<any> {
        console.error('An error occurred', error); 

        return Promise.reject(error.message || error);
    }

    getBook(id: number): Promise<Book> {
        const url = `${this.booksUrl}/${id}`;

        return this.http.get(url)
        .toPromise()
        .then(response => response.json().data as Book)
        .catch(this.handleError);
    }

    private headers = new Headers({'Content-Type': 'application/json'});

    update(book: Book): Promise<Book> {
        const url = `${this.booksUrl}/${book.id}`;

        return this.http.put(url, JSON.stringify(book), {headers: this.headers})
                .toPromise()
                .then(() => book)
                .catch(this.handleError);
    }

    create(title: string, author: string, isbn: string, description: string, 
          classUse: string, condition: string, seller: string, price: string, img: string,  date: string): Promise<Book> {
        
        return this.http
        .post(this.booksUrl, JSON.stringify({title: title, author: author, isbn: isbn, description: description,
                                             classUse: classUse, condition: condition, seller: seller, price: price, img: img,  date: date})
                                            , {headers: this.headers})
        .toPromise()
        .then(res => res.json().data as Book)
        .catch(this.handleError);
    }

    delete(id: number): Promise<void> {
        const url = `${this.booksUrl}/${id}`;

        return this.http.delete(url, {headers: this.headers}).toPromise()
        .then(() => null)
        .catch(this.handleError);
    }

}