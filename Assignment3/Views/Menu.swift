//
//  Menu.swift
//  Assignment3
//
//  Created by Mark Gamble on 4/25/23.
//

import SwiftUI

struct Menu: View {
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        NavigationLink(destination: Art()) {
          Text("Art")
            .font(.title)
            .padding(.bottom)
        }
        NavigationLink(destination: Photographs()) {
          Text("Photographs")
            .font(.title)
        }
        Spacer()
      }
      .padding()
      .navigationTitle("Menu")
    }
  }
}
