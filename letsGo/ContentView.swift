//
//  ContentView.swift
//  letsGo
//
//  Created by Ava Laukkanen on 31/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ReviewViewModel()
    @State private var showingAddReview = false

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.reviews) { review in
                    VStack(alignment: .leading) {
                        if let image = review.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                        }
                        Text(review.title)
                            .font(.headline)
                        Text(review.content)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("Travel Reviews")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddReview.toggle()
                        }) {
                            Label("Add Review", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddReview) {
                    AddReviewView(viewModel: viewModel)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
