//
//  ReadingView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct ReadingView: View {
    let book: Book
    @EnvironmentObject var readingPreferences: ReadingPreferences
    @State private var showingSettings = false
    @State private var showingShareSheet = false
    @State private var selectedText = ""
    @State private var showingNoteSheet = false
    @State private var highlights: [TextHighlight] = []
    @State private var notes: [ReadingNote] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Reading Progress
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Chapter 1")
                            .font(.caption)
                            .foregroundColor(.warmOrange)
                        
                        Spacer()
                        
                        Text("Progress: 25%")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    ProgressView(value: 0.25)
                        .accentColor(.warmOrange)
                }
                .padding(.horizontal)
                
                // Interactive Reading Content
                VStack(alignment: .leading, spacing: 16) {
                    Text(book.content)
                        .font(.system(size: readingPreferences.fontSize))
                        .lineSpacing(readingPreferences.lineSpacing)
                        .foregroundColor(.white)
                        .textSelection(.enabled)
                        .onLongPressGesture {
                            showTextSelectionOptions()
                        }
                    
                    // Highlights and Notes Section
                    if !highlights.isEmpty || !notes.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Your Notes & Highlights")
                                .font(.headline)
                                .foregroundColor(.warmOrange)
                            
                            ForEach(highlights) { highlight in
                                HighlightView(highlight: highlight)
                            }
                            
                            ForEach(notes) { note in
                                NoteView(note: note)
                            }
                        }
                        .padding()
                        .background(Color.mediumBackground)
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .background(Color.darkBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: { showingShareSheet = true }) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.warmOrange)
                }
                
                Button("Settings") {
                    showingSettings = true
                }
                .foregroundColor(.warmOrange)
            }
        }
        .sheet(isPresented: $showingSettings) {
            ReadingSettingsView()
        }
        .sheet(isPresented: $showingShareSheet) {
            SocialShareView(book: book, selectedText: selectedText)
        }
        .sheet(isPresented: $showingNoteSheet) {
            AddNoteView { noteText in
                addNote(noteText)
            }
        }
    }
    
    private func showTextSelectionOptions() {
        // Simulate text selection - in a real app this would be more sophisticated
        selectedText = "We stand at the threshold of a new renaissance..."
        showingShareSheet = true
    }
    
    private func addHighlight(_ text: String) {
        let highlight = TextHighlight(text: text, color: .warmOrange, location: highlights.count)
        highlights.append(highlight)
    }
    
    private func addNote(_ text: String) {
        let note = ReadingNote(content: text, location: notes.count, timestamp: Date())
        notes.append(note)
    }
} 