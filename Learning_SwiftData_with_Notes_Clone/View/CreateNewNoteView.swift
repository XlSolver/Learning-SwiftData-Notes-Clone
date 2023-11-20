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
    
    
    var body: some View {
        NavigationStack {
            
                //.navigationTitle("All iCloud")
        }
        .toolbar{
            ToolbarItemGroup(placement: .topBarLeading){
                Image(systemName: "square.and.pencil")
            }
        }
    }
    
    func addNote() {
        let newNote = Notes(name: Title, image: image, textField: TextContent, date: Date())
        context.insert(newNote)
        return
    }
}

#Preview {
    CreateNewNoteView()
        .modelContainer(notesContainer)
}
