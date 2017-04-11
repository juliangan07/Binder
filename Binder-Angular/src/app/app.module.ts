import { NgModule }      from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent }  from './app.component';
import { BookDetailComponent } from './book-detail.component';
import { BookComponent } from './book.component';
import { BookService } from './book.service';
import { DefaultComponent } from './default.component';
import { UpdateModule } from './update.module';
import { UploadModule } from './upload.module';
import { BookSearchComponent } from './book-search.component';
import { RegisterComponent } from './register.component';

import { AppRoutingModule } from './app-routing.module';

import { InMemoryWebApiModule } from 'angular-in-memory-web-api';
import { InMemoryDataService } from './in-memory-data.service';

@NgModule({
  imports:  [ 
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpModule,
    InMemoryWebApiModule.forRoot(InMemoryDataService),
    ],
  declarations: [ 
    AppComponent, 
    BookDetailComponent,
    BookComponent,
    DefaultComponent,
    UpdateModule,
    UploadModule,
    BookSearchComponent,
    RegisterComponent
    ],
  providers: [ BookService ],
  bootstrap: [ AppComponent ]
})

export class AppModule {}
