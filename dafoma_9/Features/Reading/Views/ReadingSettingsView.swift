//
//  ReadingSettingsView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct ReadingSettingsView: View {
    @EnvironmentObject var readingPreferences: ReadingPreferences
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Font Size")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    HStack {
                        Text("A")
                            .font(.caption)
                        Slider(value: $readingPreferences.fontSize, in: 12...24, step: 1)
                            .accentColor(.warmOrange)
                        Text("A")
                            .font(.title3)
                    }
                    .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Line Spacing")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    Slider(value: $readingPreferences.lineSpacing, in: 1.0...2.0, step: 0.1)
                        .accentColor(.warmOrange)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.darkBackground)
            .navigationTitle("Reading Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.warmOrange)
                }
            }
        }
    }
} 