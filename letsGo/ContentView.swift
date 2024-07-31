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
            ZStack {
                EllipticalGradient(colors:[Color.pink, Color.orange], center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadiusFraction: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, endRadiusFraction: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                VStack {
                    List(viewModel.reviews) { review in
                        VStack(alignment: .leading) {
                            Text(review.title)
                            
                                .font(.headline)
                            Text(review.content)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                    .navigationTitle("travel reviews")
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showingAddReview.toggle()
                            }) {
                                Label("Add Review", systemImage: "square.and.pencil.circle")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
