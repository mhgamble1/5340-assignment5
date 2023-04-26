//
//  BooksViewModel.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import Foundation

class BooksViewModel: ObservableObject {
  @Published var books: [Book] = []

  func getBooks() async {
    let urlString = "https://gutendex.com/books"

    guard let url = URL(string: urlString) else { return }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let booksResponse = try JSONDecoder().decode(BooksResponse.self, from: data)
      DispatchQueue.main.async {
        self.books = booksResponse.results
      }
    } catch {
      print("Error fetching books: \(error.localizedDescription)")
    }
  }
}

struct BooksResponse: Codable {
  let count: Int
  let next: String?
  let previous: String?
  let results: [Book]
}
