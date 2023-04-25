//
//  Photographs.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import SwiftUI

struct Photographs: View {
  @State private var photographs: [Photograph] = []

  var body: some View {
    NavigationView {
      List {
        ForEach(photographs) { photograph in
          NavigationLink(destination: PhotographDetail(photograph: photograph)) {
            VStack(alignment: .leading) {
              AsyncImage(
                url: URL(string: photograph.download_url)!
              ) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
              } placeholder: {
                ProgressView()
              }
              .frame(
                width: UIScreen.main.bounds.width - 40,
                height: UIScreen.main.bounds.width - 40
              )
              .cornerRadius(4)
              .padding(.bottom, 4)

              VStack(alignment: .leading) {
                Text(photograph.author)
                  .font(.headline)
              }
            }
          }
        }
      }
      .listStyle(.grouped)
      .navigationTitle("Photographs")
      .onAppear(perform: loadPhotographs)
    }
    .navigationBarTitle("", displayMode: .inline)
  }

  func loadPhotographs() {
    guard let url = URL(string: "https://picsum.photos/v2/list?page=2&limit=100") else {
      print("Invalid URL")
      return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data {
        if let decodedPhotographs = try? JSONDecoder().decode([Photograph].self, from: data) {
          DispatchQueue.main.async {
            self.photographs = decodedPhotographs
          }
          return
        }
      }
      print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }.resume()
  }
}
