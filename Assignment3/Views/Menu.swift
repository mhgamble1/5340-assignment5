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
      VStack(spacing: 20) {
        Text("Menu")
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding()
          .foregroundColor(Color("Text"))

        Text(
          "Welcome to our Multimedia viewing app! Here you can explore various art pieces from the Art Institute of Chicago, discover a selection of classic books from Project Gutenberg, and browse a collection of photographs, and . Tap on any of the buttons below to start your journey."
        )
        .font(.body)
        .multilineTextAlignment(.center)
        .padding()
        .foregroundColor(Color("Text"))
        

        NavigationLink(destination: Art()) {
          Text("Art")
            .font(.title)
            .foregroundColor(Color("Secondary"))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("Background"))
            .cornerRadius(10)
        }
        .padding(.horizontal)

        NavigationLink(destination: Books()) {
          Text("Books")
            .font(.title)
            .foregroundColor(Color("Secondary"))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("Background"))
            .cornerRadius(10)
        }
        .padding(.horizontal)

        NavigationLink(destination: Photographs()) {
          Text("Photographs")
            .font(.title)
            .foregroundColor(Color("Secondary"))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("Background"))
            .cornerRadius(10)
        }
        .padding(.horizontal)

        Spacer()
      }
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(true)
    }
  }
}
