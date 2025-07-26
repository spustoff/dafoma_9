//
//  HighlightView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct HighlightView: View {
    let highlight: TextHighlight
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Rectangle()
                    .fill(highlight.color)
                    .frame(width: 4, height: 20)
                
                Text("Highlight")
                    .font(.caption)
                    .foregroundColor(.warmOrange)
                
                Spacer()
            }
            
            Text(highlight.text)
                .font(.body)
                .foregroundColor(.white)
                .padding(.leading, 12)
        }
        .padding(.vertical, 8)
    }
} 