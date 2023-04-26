//
//  PhotoViewModel.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import Foundation

class PhotographsViewModel: ObservableObject {
  @Published var photographs: [Photograph] = []
  private let urlString = "https://picsum.photos/v2/list?page=2&limit=100"

  @MainActor
  func getPhotographs() async {
    guard let url = URL(string: urlString) else { return }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decodedPhotographs = try JSONDecoder().decode([Photograph].self, from: data)
      DispatchQueue.main.async {
        self.photographs = decodedPhotographs
      }
    } catch {
      print("Error fetching photographs: \(error.localizedDescription)")
    }
  }
}
