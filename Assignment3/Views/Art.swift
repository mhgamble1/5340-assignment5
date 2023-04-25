//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct Art: View {

    @StateObject var artViewModel = ArtViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(artViewModel.art) { art in
                    NavigationLink {
                        ArtDetail(art: art)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(art.title)
                                .font(.headline)
                            Text(art.artist_display)
                                .font(.subheadline)
                        }
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
            .navigationTitle("Art")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Art()
    }
}
