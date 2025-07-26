//
//  BookCard.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct BookCard: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Cover Image
            Image(systemName: book.cover)
                .font(.largeTitle)
                .foregroundColor(.warmOrange)
                .frame(height: 80)
                .frame(maxWidth: .infinity)
            
            // Title and Author
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(book.author)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .padding()
        .background(Color.mediumBackground)
        .cornerRadius(12)
    }
} 