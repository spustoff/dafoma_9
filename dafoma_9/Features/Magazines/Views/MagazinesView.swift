//
//  MagazinesView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct MagazinesView: View {
    @State private var searchText = ""
    
    let sampleMagazines = [
        Magazine(
            title: "Tech Today",
            issue: "Issue #42",
            cover: "laptopcomputer",
            description: "The latest in technology and innovation",
            articles: [
                Article(title: "AI Revolution", content: "Artificial Intelligence is transforming industries..."),
                Article(title: "Green Tech", content: "Sustainable technology solutions for the future..."),
                Article(title: "Quantum Computing", content: "The next frontier in computational power...")
            ]
        ),
        Magazine(
            title: "Literary Quarterly",
            issue: "Spring 2024",
            cover: "text.book.closed",
            description: "Contemporary literature and criticism",
            articles: [
                Article(title: "Modern Poetry", content: "Exploring new voices in contemporary poetry..."),
                Article(title: "Fiction Trends", content: "Current trends in literary fiction..."),
                Article(title: "Author Interview", content: "A conversation with emerging writers...")
            ]
        ),
        Magazine(
            title: "Science Frontiers",
            issue: "Vol. 15",
            cover: "atom",
            description: "Discoveries at the edge of knowledge",
            articles: [
                Article(title: "Space Exploration", content: "New missions to Mars and beyond..."),
                Article(title: "Climate Science", content: "Understanding climate change impacts..."),
                Article(title: "Medical Breakthroughs", content: "Latest advances in medicine...")
            ]
        )
    ]
    
    var filteredMagazines: [Magazine] {
        if searchText.isEmpty {
            return sampleMagazines
        } else {
            return sampleMagazines.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.warmOrange)
                    
                    TextField("Search magazines...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color.mediumBackground)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Magazines List
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(filteredMagazines) { magazine in
                            NavigationLink(destination: MagazineDetailView(magazine: magazine)) {
                                MagazineCard(magazine: magazine)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .background(Color.darkBackground)
            .navigationTitle("Magazines")
            .navigationBarTitleDisplayMode(.large)
        }
    }
} 