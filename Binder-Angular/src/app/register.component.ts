import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { Register } from './register';

@Component({
  selector: 'register',
  templateUrl: './app/register.component.html',
  styleUrls: ['./app/register.component.css']
  
})

export class RegisterComponent { 
    appTitle = 'Binder';

    demoEmail = 'first.last@und.edu';

    demoPassword = '12345';

    autoID = 2;

    model = new Register(this.autoID, '', '', '', '')

    submitted = false;

    onSubmit() { this.submitted = true; }

    get diagnostic() { return JSON.stringify(this.model); }

    constructor(
    private router: Router
    ) {}

    newRegister() {
      this.model = new Register(this.autoID, '', '', '', '');
      this.submitted = true;
    }

}