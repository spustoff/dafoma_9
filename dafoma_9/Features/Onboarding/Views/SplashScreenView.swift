//
//  SplashScreenView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var animateTitle = false
    @State private var animateSubtitle = false
    @State private var animateIcon = false
    @State private var rotateLogo = false
    
    var body: some View {
        ZStack {
            // Animated Background
            LinearGradient(
                colors: [
                    Color.darkBackground,
                    Color.mediumBackground,
                    Color.black
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Floating particles effect
            ForEach(0..<20, id: \.self) { _ in
                Circle()
                    .fill(Color.warmOrange.opacity(0.1))
                    .frame(width: .random(in: 4...12), height: .random(in: 4...12))
                    .position(
                        x: .random(in: 0...UIScreen.main.bounds.width),
                        y: .random(in: 0...UIScreen.main.bounds.height)
                    )
                    .animation(
                        Animation.easeInOut(duration: .random(in: 2...4))
                            .repeatForever(autoreverses: true)
                            .delay(.random(in: 0...2)),
                        value: animateIcon
                    )
            }
            
            VStack(spacing: 30) {
                Spacer()
                
                // App Icon
                ZStack {
                    Circle()
                        .fill(Color.warmOrange.opacity(0.2))
                        .frame(width: 120, height: 120)
                        .scaleEffect(animateIcon ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateIcon)
                    
                    Image(systemName: "book.pages.fill")
                        .font(.system(size: 50, weight: .light))
                        .foregroundColor(.warmOrange)
                        .rotationEffect(.degrees(rotateLogo ? 360 : 0))
                        .animation(.easeInOut(duration: 2.0), value: rotateLogo)
                }
                
                // App Title
                VStack(spacing: 12) {
                    Text("Literate Hue")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(.white)
                        .opacity(animateTitle ? 1.0 : 0.0)
                        .scaleEffect(animateTitle ? 1.0 : 0.8)
                        .animation(.easeOut(duration: 1.0).delay(0.5), value: animateTitle)
                    
                    Text("A Beautiful Reading Experience")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .opacity(animateSubtitle ? 1.0 : 0.0)
                        .offset(y: animateSubtitle ? 0 : 20)
                        .animation(.easeOut(duration: 1.0).delay(1.0), value: animateSubtitle)
                }
                
                Spacer()
                
                // Loading Indicator
                VStack(spacing: 16) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .warmOrange))
                        .scaleEffect(1.2)
                    
                    Text("Loading...")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .opacity(animateSubtitle ? 1.0 : 0.0)
                .animation(.easeOut(duration: 0.5).delay(1.5), value: animateSubtitle)
                
                Spacer()
            }
        }
        .onAppear {
            animateIcon = true
            animateTitle = true
            animateSubtitle = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                rotateLogo = true
            }
        }
        .preferredColorScheme(.dark)
    }
} 