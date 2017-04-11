import { NgModule }             from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DefaultComponent }   from './default.component';
import { BookComponent }      from './book.component';
import { BookDetailComponent }  from './book-detail.component';
import { UpdateModule } from './update.module';
import { UploadModule } from './upload.module';
import { RegisterComponent } from './register.component';

const routes: Routes = [
  { path: '', redirectTo: '/default', pathMatch: 'full' },
  { path: 'default',  component: DefaultComponent },
  { path: 'booklist/:id', component: BookDetailComponent },
  { path: 'book',     component: BookComponent },
  { path: 'update/:id', component: UpdateModule },
  { path: 'upload', component: UploadModule },
  { path: 'register', component: RegisterComponent }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})

export class AppRoutingModule {}
