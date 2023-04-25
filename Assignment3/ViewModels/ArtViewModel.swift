//
//  ArtViewModel.swift
//  Assignment3
//
//  Created by Mark Gamble on 3/26/23.
//

import Foundation

class ArtViewModel: ObservableObject {
    @Published var art = [ArtModel]()
    private let url = "https://api.artic.edu/api/v1/artworks?limit=20"

    @MainActor
    func getArt() async {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let artResponse = try JSONDecoder().decode(ArtResponse.self, from: data)
            art = artResponse.data.filter { $0.image_id != nil }
        } catch {
            print(error)
        }
    }

}
