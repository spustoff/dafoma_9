//
//  TextHighlight.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct TextHighlight: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
    let location: Int
} 