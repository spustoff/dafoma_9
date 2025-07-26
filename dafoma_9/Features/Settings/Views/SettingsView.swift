//
//  SettingsView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var readingPreferences: ReadingPreferences
    @EnvironmentObject var onboardingManager: OnboardingManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Reading Preferences
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Reading Preferences")
                            .font(.headline)
                            .foregroundColor(.warmOrange)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Font Size")
                                .foregroundColor(.white)
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
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Line Spacing")
                                .foregroundColor(.white)
                            Slider(value: $readingPreferences.lineSpacing, in: 1.0...2.0, step: 0.1)
                                .accentColor(.warmOrange)
                        }
                    }
                    .padding()
                    .background(Color.mediumBackground)
                    .cornerRadius(12)
                    
                    // About Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("About")
                            .font(.headline)
                            .foregroundColor(.warmOrange)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Literate Hue")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Version 1.0.0")
                                .foregroundColor(.gray)
                            
                            Text("A beautiful reading experience with curated books and magazines.")
                                .font(.body)
                                .foregroundColor(.white)
                                .lineSpacing(1.2)
                        }
                    }
                    .padding()
                    .background(Color.mediumBackground)
                    .cornerRadius(12)
                    
                    // Social Sharing Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Share")
                            .font(.headline)
                            .foregroundColor(.warmOrange)
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share App")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.darkBackground)
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.mediumBackground)
                    .cornerRadius(12)
                    
                    // Developer Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Developer")
                            .font(.headline)
                            .foregroundColor(.warmOrange)
                        
                        Button(action: {
                            let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                            impactFeedback.impactOccurred()
                            onboardingManager.resetOnboarding()
                        }) {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Reset Onboarding")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.alertRed)
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.mediumBackground)
                    .cornerRadius(12)
                }
                .padding()
            }
            .background(Color.darkBackground)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
} 