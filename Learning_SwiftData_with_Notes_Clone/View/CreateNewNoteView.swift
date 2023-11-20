//
//  CreateNewNoteView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 17/11/23.
//

import SwiftUI
import SwiftData

struct CreateNewNoteView: View {
    @Environment (\.modelContext) private var context
    @State private var Title: String = ""
    @State private var image: [Data] = []
    @State private var TextContent: String = ""
    @State private var fullText: String = ""
    
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $fullText)
        }
        .foregroundStyle(.yellow)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing){
                Button(action: shareButton) {
                    Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.yellow)
                }
            }
        }
    }
    
    
    func addNote() {
        let newNote = Notes(name: Title, image: image, textField: TextContent, date: Date())
        context.insert(newNote)
        return
    }
    
    func shareButton() {
        print("Condividi")
//            let url = URL(string: "https://www.swiftuiio.com/")
//            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
//
//            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

#Preview {
    CreateNewNoteView()
        .modelContainer(notesContainer)
}
