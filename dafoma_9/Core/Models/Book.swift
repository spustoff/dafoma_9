//
//  Book.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let cover: String
    let description: String
    let content: String
    let category: BookCategory
} 