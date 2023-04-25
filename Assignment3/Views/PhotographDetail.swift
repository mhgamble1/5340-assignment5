//
//  PhotographDetail.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import SwiftUI

struct PhotographDetail: View {
  let photograph: Photograph

  var body: some View {
    VStack {
      Text(photograph.author)
        .font(.title)
        .fontWeight(.bold)

      AsyncImage(url: URL(string: photograph.download_url)) { image in
        image.resizable()
      } placeholder: {
        ProgressView()
      }
      .aspectRatio(contentMode: .fit)
    }
    .padding()
    .navigationTitle("Photograph")
  }
}
