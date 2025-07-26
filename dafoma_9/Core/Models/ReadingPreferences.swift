//
//  ReadingPreferences.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

class ReadingPreferences: ObservableObject {
    @Published var fontSize: Double = 16.0
    @Published var fontFamily: String = "System"
    @Published var isDarkMode: Bool = true
    @Published var lineSpacing: Double = 1.2
} 