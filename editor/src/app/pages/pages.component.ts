import { Component, OnInit } from '@angular/core';
import { PAGES } from '../mock-pages';
import { Page } from '../page';

@Component({
  selector: 'app-pages',
  templateUrl: './pages.component.html',
  styleUrls: ['./pages.component.css']
})

export class PagesComponent implements OnInit {
  pages = PAGES;

  constructor() { }

  ngOnInit() {
  }

    selectedPage: Page;

    onSelect(page: Page): void {
      this.selectedPage = page;
    }

}
