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
    @Query var notes: [Notes]

    var body: some View {
        NavigationView {
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
            }
            .navigationTitle("All iCloud")
        }
    }
}

#Preview {
    AlliCloudNotesView()
        .modelContainer(notesContainer)
}
