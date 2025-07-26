//
//  OnboardingView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @State private var currentPage = 0
    @State private var animateGradient = false
    
    let pages = [
        OnboardingPage(
            title: "Welcome to Literate Hue",
            description: "Discover a beautiful reading experience with curated books and magazines in our unique color palette.",
            systemImage: "book.pages",
            backgroundColor: .darkBackground,
            accentColor: .warmOrange
        ),
        OnboardingPage(
            title: "Vast Library",
            description: "Explore thousands of books across fiction, non-fiction, science, and more. Find your next favorite read.",
            systemImage: "books.vertical",
            backgroundColor: .mediumBackground,
            accentColor: .highlightGreen
        ),
        OnboardingPage(
            title: "Magazine Collection",
            description: "Stay updated with the latest magazines covering technology, literature, science, and contemporary topics.",
            systemImage: "newspaper",
            backgroundColor: .darkBackground,
            accentColor: .warmOrange
        ),
        OnboardingPage(
            title: "Personal Reading",
            description: "Customize your reading experience with adjustable fonts, highlights, notes, and bookmarks.",
            systemImage: "text.alignleft",
            backgroundColor: .mediumBackground,
            accentColor: .alertRed
        ),
        OnboardingPage(
            title: "Share & Connect",
            description: "Share your favorite quotes and discoveries with friends through social media and messaging.",
            systemImage: "square.and.arrow.up",
            backgroundColor: .darkBackground,
            accentColor: .highlightGreen
        )
    ]
    
    var body: some View {
        ZStack {
            // Animated Background Gradient
            LinearGradient(
                colors: [
                    pages[currentPage].backgroundColor,
                    pages[currentPage].backgroundColor.opacity(0.8),
                    Color.black
                ],
                startPoint: animateGradient ? .topLeading : .bottomTrailing,
                endPoint: animateGradient ? .bottomTrailing : .topLeading
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: animateGradient)
            
            VStack {
                // Skip Button
                HStack {
                    Spacer()
                    Button("Skip") {
                        onboardingManager.completeOnboarding()
                    }
                    .foregroundColor(.gray)
                    .padding()
                }
                
                Spacer()
                
                // Page Content
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        OnboardingPageView(page: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 500)
                
                Spacer()
                
                // Page Indicators
                HStack(spacing: 12) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? pages[currentPage].accentColor : Color.gray.opacity(0.4))
                            .frame(width: 12, height: 12)
                            .scaleEffect(index == currentPage ? 1.2 : 1.0)
                            .animation(.easeInOut(duration: 0.3), value: currentPage)
                    }
                }
                .padding(.bottom, 30)
                
                // Navigation Buttons
                HStack {
                    // Previous Button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            if currentPage > 0 {
                                currentPage -= 1
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Previous")
                        }
                        .foregroundColor(currentPage > 0 ? .white : .gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            currentPage > 0 ? 
                            Color.mediumBackground : 
                            Color.gray.opacity(0.2)
                        )
                        .cornerRadius(12)
                    }
                    .disabled(currentPage == 0)
                    
                    Spacer()
                    
                    // Next/Get Started Button
                    Button(action: {
                        withAnimation(.easeInOut) {
                            if currentPage < pages.count - 1 {
                                currentPage += 1
                            } else {
                                // Complete onboarding
                                let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
                                impactFeedback.impactOccurred()
                                onboardingManager.completeOnboarding()
                            }
                        }
                    }) {
                        HStack {
                            Text(currentPage == pages.count - 1 ? "Get Started" : "Next")
                            if currentPage < pages.count - 1 {
                                Image(systemName: "chevron.right")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(pages[currentPage].accentColor)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            animateGradient.toggle()
        }
        .preferredColorScheme(.dark)
    }
} 
