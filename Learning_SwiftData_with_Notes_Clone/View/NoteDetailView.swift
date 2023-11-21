//
//  NoteDetailView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 21/11/23.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment (\.modelContext) private var context
    var note: Notes
    
    var body: some View {
        NavigationStack{
            Text(note.content.textField)
                .navigationTitle(note.name)
        }
    }
}

#Preview {
    NoteDetailView(note: Notes(id: UUID(), name: "Name", content: NoteContent(textField: "testestestest", image: []), date: Date.now))
        .modelContainer(previewContainer)
}
