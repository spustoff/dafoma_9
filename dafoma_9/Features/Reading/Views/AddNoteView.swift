//
//  AddNoteView.swift
//  Literate Hue
//
//  Created by Вячеслав on 7/26/25.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var noteText = ""
    let onSave: (String) -> Void
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Add Note")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.warmOrange)
                
                TextEditor(text: $noteText)
                    .font(.body)
                    .foregroundColor(.white)
                    .background(Color.mediumBackground)
                    .cornerRadius(8)
                    .frame(minHeight: 200)
                
                Spacer()
            }
            .padding()
            .background(Color.darkBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.alertRed)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSave(noteText)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.highlightGreen)
                    .disabled(noteText.isEmpty)
                }
            }
        }
    }
} 