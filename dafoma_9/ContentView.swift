//
//  ContentView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var readingPreferences = ReadingPreferences()
    @StateObject private var onboardingManager = OnboardingManager()
    @State private var selectedTab = 0
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                showSplash = false
                            }
                        }
                    }
            } else if !onboardingManager.hasCompletedOnboarding {
                OnboardingView()
                    .environmentObject(onboardingManager)
                    .transition(.opacity)
            } else {
                MainTabView(selectedTab: $selectedTab)
                    .environmentObject(readingPreferences)
                    .environmentObject(onboardingManager)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showSplash)
        .animation(.easeInOut(duration: 0.5), value: onboardingManager.hasCompletedOnboarding)
    }
}

struct MainTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LibraryView()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Library")
                }
                .tag(0)
            
            MagazinesView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Magazines")
                }
                .tag(1)
            
            BookmarksView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmarks")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
                .tag(3)
        }
        .accentColor(.warmOrange)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
