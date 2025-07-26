//
//  MagazineDetailView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct MagazineDetailView: View {
    let magazine: Magazine
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: magazine.cover)
                        .font(.system(size: 80))
                        .foregroundColor(.warmOrange)
                    
                    VStack(spacing: 8) {
                        Text(magazine.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(magazine.issue)
                            .font(.title3)
                            .foregroundColor(.warmOrange)
                    }
                    
                    Text(magazine.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                // Articles Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Articles")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.warmOrange)
                        .padding(.horizontal)
                    
                    ForEach(magazine.articles) { article in
                        NavigationLink(destination: ArticleView(article: article, magazine: magazine)) {
                            ArticleCard(article: article)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background(Color.darkBackground)
        .navigationBarTitleDisplayMode(.inline)
    }
} 