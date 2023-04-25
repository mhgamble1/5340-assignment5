//
//  ArtDetail.swift
//  Assignment3
//
//  Created by Mark Gamble on 3/26/23.
//

import SwiftUI

struct ArtDetail: View {

    var art: ArtModel

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(art.title)
                    .font(.title)
                    .padding()
                    .foregroundColor(Color("Primary"))
                AsyncImage(url: URL(string: "https://www.artic.edu/iiif/2/\(art.image_id!)/full/843,/0/default.jpg")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                Text(art.artist_display)
                    .font(.title2)
                    .padding()
                    .foregroundColor(Color("Secondary"))
                Text("Date: \(art.date_display)")
                    .font(.title3)
                    .foregroundColor(Color("Text"))
                if let dimensions = art.dimensions {
                    Text("Dimensions: \(dimensions)")
                        .font(.title3)
                        .foregroundColor(Color("Text"))
                }
                if let place_of_origin = art.place_of_origin {
                    Text("Place of Origin: \(place_of_origin)")
                        .font(.title3)
                        .foregroundColor(Color("Text"))
                }
                if let credit_line = art.credit_line {
                    Text("Credit Line: \(credit_line)")
                        .font(.title3)
                        .foregroundColor(Color("Text"))
                }
                if let publication_history = art.publication_history {
                    Text("Publication History: \(publication_history)")
                        .font(.title3)
                        .foregroundColor(Color("Text"))
                }
            }
            .padding()
        }
    }
}
