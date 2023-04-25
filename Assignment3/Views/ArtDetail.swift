//
//  ArtDetail.swift
//  Assignment3
//
//  Created by Mark Gamble on 3/26/23.
//

import SwiftUI

struct ArtDetail: View {

  var art: ArtModel

  var body: some View {
    ScrollView {
      VStack {
        Text(art.title)
          .font(.title)
          .padding()
          AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/\(art.image_id ?? "")/full/843,/0/default.jpg")) { image in
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
        } placeholder: {
            if art.image_id == nil {
              Text("Image not available")
            } else {
              ProgressView()
            }
          }
        .scaledToFit()
        Text(art.artist_display)
          .font(.title2)
          .padding()
        Text(art.date_display)
          .font(.title3)
          .padding()
        Text(art.medium_display)
          .font(.title3)
          .padding()
        Text(art.publication_history ?? "No publication history")
          .font(.title3)
          .padding()
      }
    }
  }
}
