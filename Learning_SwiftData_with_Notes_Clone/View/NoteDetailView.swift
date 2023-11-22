//
//  NoteDetailView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 21/11/23.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Environment (\.modelContext) private var context
    var note: Notes
    
    var body: some View {
        NavigationStack{
            Text(note.name)
                .accessibilityAddTraits([.isButton])

                .accessibilityLabel("\(note.name) note")
            Text(note.content.textField)
                .lineLimit(10)
            
            
                .navigationTitle(note.name)
        }
    }
}

#Preview {
    //it needs to be recreated for every view
    let schema = Schema([
        Notes.self,
        NoteContent.self,
        TestModel.self
    ])
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: schema, configurations: config)
    
    let note = Notes(name: "Test note", content: NoteContent(textField: "Test title", image: []), date: Date.now)
    //This creates a binding between context and model into database
    container.mainContext.insert(note)
    
    return NoteDetailView(note: note)
    
    
        .modelContainer(notesContainer)
}
