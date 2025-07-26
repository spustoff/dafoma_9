//
//  LibraryView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct LibraryView: View {
    @State private var searchText = ""
    @State private var selectedCategory: BookCategory? = nil
    
    let sampleBooks = [
        Book(title: "The Digital Renaissance", author: "Sarah Chen", cover: "book.closed", description: "A compelling exploration of how technology is reshaping human creativity.", content: "Chapter 1: The New Age\n\nWe stand at the threshold of a new renaissance...", category: .nonFiction),
        Book(title: "Quantum Dreams", author: "Dr. Michael Torres", cover: "atom", description: "A journey through the strange world of quantum physics.", content: "Introduction\n\nQuantum mechanics challenges our understanding...", category: .science),
        Book(title: "The Art of Minimalism", author: "Emma Johnson", cover: "square.on.square", description: "Finding peace and purpose through intentional living.", content: "Chapter 1: Less is More\n\nIn a world of endless consumption...", category: .nonFiction),
        Book(title: "Starlight Chronicles", author: "Alex Rivera", cover: "star", description: "An epic space adventure across the galaxy.", content: "Prologue\n\nThe stars had never seemed so distant...", category: .fiction)
    ]
    
    var filteredBooks: [Book] {
        var books = sampleBooks
        
        if let category = selectedCategory {
            books = books.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            books = books.filter { 
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.author.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return books
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.warmOrange)
                    
                    TextField("Search books...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color.mediumBackground)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Category Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        CategoryChip(title: "All", isSelected: selectedCategory == nil) {
                            selectedCategory = nil
                        }
                        
                        ForEach(BookCategory.allCases.filter { $0 != .magazine }, id: \.self) { category in
                            CategoryChip(title: category.rawValue, isSelected: selectedCategory == category) {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                
                // Books Grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        ForEach(filteredBooks) { book in
                            NavigationLink(destination: BookDetailView(book: book)) {
                                BookCard(book: book)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .background(Color.darkBackground)
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.large)
        }
    }
} 