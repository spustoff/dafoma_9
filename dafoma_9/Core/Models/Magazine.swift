//
//  Magazine.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import Foundation

struct Magazine: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let issue: String
    let cover: String
    let description: String
    let articles: [Article]
} 