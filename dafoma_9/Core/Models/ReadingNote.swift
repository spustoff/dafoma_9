//
//  ReadingNote.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import Foundation

struct ReadingNote: Identifiable {
    let id = UUID()
    let content: String
    let location: Int
    let timestamp: Date
} 