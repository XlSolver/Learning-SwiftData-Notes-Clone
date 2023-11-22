//
//  AlliCloudNotesView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 21/11/23.
//

import SwiftUI
import SwiftData

struct AlliCloudNotesView: View {
    @Environment (\.modelContext) private var context
    @Query private var notes: [Notes]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        Text(note.name)
                            .accessibilityLabel("\(note.name) note")
                            .accessibilityAddTraits(.isButton)
                        Text(note.content.textField)
                            .accessibilityLabel(note.content.textField)
                    }
                }
            }
        }
    }
}

#Preview {
    AlliCloudNotesView()
        .modelContainer(notesContainer)
}
