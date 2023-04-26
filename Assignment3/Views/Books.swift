//
//  Books.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import SwiftUI

struct Books: View {
  @StateObject var booksViewModel = BooksViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(booksViewModel.books) { book in
          if let htmlURL = book.formats["text/html"] {
            Button(action: {
              if let url = URL(string: htmlURL) {
                UIApplication.shared.open(url)
              }
            }) {
              VStack(alignment: .leading) {
                Text(book.title)
                  .font(.headline)
                  .foregroundColor(Color("Text"))
                Text(book.authors.map { $0.name }.joined(separator: ", "))
                  .font(.subheadline)
                  .foregroundColor(Color("Text"))
              }
            }
          }
        }
      }
      .listStyle(.grouped)
      .navigationTitle("Books")
      .onAppear {
        Task {
          await booksViewModel.getBooks()
        }
      }
    }
    .navigationBarTitle("", displayMode: .inline)
  }
}
