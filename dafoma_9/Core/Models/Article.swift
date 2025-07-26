//
//  Article.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let content: String
} 