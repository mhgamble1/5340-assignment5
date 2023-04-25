//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.

import SwiftUI

struct Art: View {
  @StateObject var artViewModel = ArtViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(artViewModel.art) { art in
          NavigationLink(destination: ArtDetail(art: art)) {
            VStack(alignment: .leading) {
              AsyncImage(
                url: URL(
                  string: "https://www.artic.edu/iiif/2/\(art.image_id!)/full/843,/0/default.jpg")!
              ) { image in
                image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
              } placeholder: {
                ProgressView()
              }
              .frame(
                width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.width - 40
              )
              .cornerRadius(4)
              .padding(.bottom, 4)

              VStack(alignment: .leading) {
                Text(art.title)
                  .font(.headline)
                  .foregroundColor(Color("Text"))
                Text(art.artist_display)
                  .font(.subheadline)
                  .foregroundColor(Color("Text"))
              }
            }
            .background(Color("Secondary"))
          }
        }
      }
      .listStyle(.grouped)
      .navigationTitle("Art")
      .onAppear {
        Task {
          await artViewModel.getArt()
        }
      }
    }
    .navigationBarTitle("", displayMode: .inline)

  }
}
