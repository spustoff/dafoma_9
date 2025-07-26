//
//  ArticleCard.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct ArticleCard: View {
    let article: Article
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(article.content.prefix(100) + "...")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.warmOrange)
                .font(.caption)
        }
        .padding()
        .background(Color.mediumBackground)
        .cornerRadius(12)
    }
} 