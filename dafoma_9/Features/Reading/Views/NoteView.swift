//
//  NoteView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct NoteView: View {
    let note: ReadingNote
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "note.text")
                    .foregroundColor(.warmOrange)
                
                Text("Note")
                    .font(.caption)
                    .foregroundColor(.warmOrange)
                
                Spacer()
                
                Text(note.timestamp, style: .date)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Text(note.content)
                .font(.body)
                .foregroundColor(.white)
                .padding(.leading, 8)
        }
        .padding(.vertical, 8)
    }
} 