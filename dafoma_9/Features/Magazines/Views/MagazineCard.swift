//
//  MagazineCard.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct MagazineCard: View {
    let magazine: Magazine
    
    var body: some View {
        HStack(spacing: 16) {
            // Cover Image
            Image(systemName: magazine.cover)
                .font(.system(size: 40))
                .foregroundColor(.warmOrange)
                .frame(width: 60, height: 80)
                .background(Color.darkBackground)
                .cornerRadius(8)
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(magazine.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(magazine.issue)
                        .font(.caption)
                        .foregroundColor(.warmOrange)
                }
                
                Text(magazine.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Text("\(magazine.articles.count) articles")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.mediumBackground)
        .cornerRadius(12)
    }
} 