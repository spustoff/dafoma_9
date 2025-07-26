//
//  BookDetailView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @EnvironmentObject var readingPreferences: ReadingPreferences
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: book.cover)
                        .font(.system(size: 80))
                        .foregroundColor(.warmOrange)
                    
                    VStack(spacing: 8) {
                        Text(book.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(book.author)
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("About")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.white)
                        .lineSpacing(readingPreferences.lineSpacing)
                }
                .padding(.horizontal)
                
                // Action Buttons
                HStack(spacing: 16) {
                    NavigationLink(destination: ReadingView(book: book)) {
                        HStack {
                            Image(systemName: "book.open")
                            Text("Read")
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.highlightGreen)
                        .cornerRadius(12)
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                            impactFeedback.impactOccurred()
                        }
                    )
                    
                    Button(action: {
                        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
                        impactFeedback.impactOccurred()
                        // Bookmark functionality would be implemented here
                    }) {
                        HStack {
                            Image(systemName: "bookmark")
                            Text("Save")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.mediumBackground)
                        .cornerRadius(12)
                    }
                    .scaleEffect(1.0)
                    .animation(.easeInOut(duration: 0.1), value: false)
                }
                .padding(.horizontal)
            }
        }
        .background(Color.darkBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
} 