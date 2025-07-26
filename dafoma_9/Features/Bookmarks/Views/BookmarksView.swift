//
//  BookmarksView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct BookmarksView: View {
    @State private var bookmarkedBooks: [Book] = []
    @State private var bookmarkedArticles: [Article] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if bookmarkedBooks.isEmpty && bookmarkedArticles.isEmpty {
                        VStack(spacing: 16) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 60))
                                .foregroundColor(.warmOrange)
                            
                            Text("No Bookmarks Yet")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("Save books and articles to read later")
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                    } else {
                        if !bookmarkedBooks.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Saved Books")
                                    .font(.headline)
                                    .foregroundColor(.warmOrange)
                                    .padding(.horizontal)
                                
                                ForEach(bookmarkedBooks) { book in
                                    BookCard(book: book)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                        if !bookmarkedArticles.isEmpty {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Saved Articles")
                                    .font(.headline)
                                    .foregroundColor(.warmOrange)
                                    .padding(.horizontal)
                                
                                ForEach(bookmarkedArticles) { article in
                                    ArticleCard(article: article)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .background(Color.darkBackground)
            .navigationTitle("Bookmarks")
            .navigationBarTitleDisplayMode(.large)
        }
    }
} 