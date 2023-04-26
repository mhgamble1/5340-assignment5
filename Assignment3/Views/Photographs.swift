//
//  Photographs.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import SwiftUI

struct Photographs: View {
  @StateObject var photographsViewModel = PhotographsViewModel()

  var body: some View {
    NavigationView {
      List {
        ForEach(photographsViewModel.photographs) { photograph in
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
      .onAppear {
        Task {
          await photographsViewModel.getPhotographs()
        }
      }
    }
    .navigationBarTitle("", displayMode: .inline)
  }
}
