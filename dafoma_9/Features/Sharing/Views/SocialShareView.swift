//
//  SocialShareView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct SocialShareView: View {
    let book: Book
    let selectedText: String
    @Environment(\.presentationMode) var presentationMode
    @State private var customMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 24) {
                // Quote Preview
                VStack(alignment: .leading, spacing: 12) {
                    Text("Share Quote")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(selectedText)")
                            .font(.body)
                            .foregroundColor(.white)
                            .italic()
                            .padding()
                            .background(Color.mediumBackground)
                            .cornerRadius(8)
                        
                        Text("— \(book.title) by \(book.author)")
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                }
                
                // Custom Message
                VStack(alignment: .leading, spacing: 8) {
                    Text("Add your thoughts")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    TextEditor(text: $customMessage)
                        .font(.body)
                        .foregroundColor(.white)
                        .background(Color.mediumBackground)
                        .cornerRadius(8)
                        .frame(height: 100)
                }
                
                // Share Options
                VStack(alignment: .leading, spacing: 16) {
                    Text("Share to")
                        .font(.headline)
                        .foregroundColor(.warmOrange)
                    
                    VStack(spacing: 12) {
                        ShareButton(title: "Copy to Clipboard", icon: "doc.on.clipboard", color: .warmOrange) {
                            copyToClipboard()
                        }
                        
                        ShareButton(title: "Share via Messages", icon: "message", color: .highlightGreen) {
                            shareViaMessages()
                        }
                        
                        ShareButton(title: "Post to Social Media", icon: "square.and.arrow.up", color: .warmOrange) {
                            shareToSocial()
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(Color.darkBackground)
            .navigationTitle("Share")
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
    
    private func copyToClipboard() {
        let shareText = selectedText
        UIPasteboard.general.string = shareText
    }
    
    private func shareViaMessages() {
        // Implementation would use MessageUI framework
        print("Share via Messages")
    }
    
    private func shareToSocial() {
        // Implementation would use Social framework or URL schemes
        print("Share to Social Media")
    }
} 
