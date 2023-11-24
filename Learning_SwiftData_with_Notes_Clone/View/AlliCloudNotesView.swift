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
    @Query (sort: \Notes.date, order: .reverse) var notes: [Notes]

    var body: some View {
        NavigationStack {
            List {
                ForEach(notes, id: \.self) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        HStack {
                            // If the note has an image, display the first one
                            if let firstImage = note.content.image.first {
                                Image(uiImage: UIImage(data: firstImage) ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }

                            VStack(alignment: .leading) {
                                Text(note.name)
                                    .font(.headline)
                                    .accessibilityLabel("\(note.name) note")

//                                Text("Folder: \()")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)

//                                Text("Last modified: \(note.lastModifiedDate, formatter: DateFormatter())")
//                                    .font(.subheadline)
//                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .accessibilityAddTraits(.isButton)
                }
                ///Delete gesture
                .onDelete(perform: deleteNotes)
            }
            .navigationTitle("All iCloud")
        }
    }
    ///Delete function
    func deleteNotes(at indexSet: IndexSet) {
        for index in indexSet {
            // find this note in our query
            let note = notes[index]

            // delete it from the context
            context.delete(notes[index])
        }
    }
    
}

#Preview {
    AlliCloudNotesView()
        .modelContainer(notesContainer)
}
