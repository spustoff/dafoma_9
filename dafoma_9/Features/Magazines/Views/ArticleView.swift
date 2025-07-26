//
//  ArticleView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    let magazine: Magazine
    @EnvironmentObject var readingPreferences: ReadingPreferences
    @State private var showingSettings = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Article Header
                VStack(alignment: .leading, spacing: 8) {
                    Text(magazine.title)
                        .font(.caption)
                        .foregroundColor(.warmOrange)
                    
                    Text(article.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                Divider()
                    .background(Color.mediumBackground)
                
                // Article Content
                Text(article.content)
                    .font(.system(size: readingPreferences.fontSize))
                    .lineSpacing(readingPreferences.lineSpacing)
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color.darkBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Settings") {
                    showingSettings = true
                }
                .foregroundColor(.warmOrange)
            }
        }
        .sheet(isPresented: $showingSettings) {
            ReadingSettingsView()
        }
    }
} 