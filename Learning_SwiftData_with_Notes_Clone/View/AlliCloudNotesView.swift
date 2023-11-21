//
//  AlliCloudNotesView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 21/11/23.
//

import SwiftUI

struct AlliCloudNotesView: View {
    @Environment (\.modelContext) private var context
    @State private var notes: [Notes]
    
    var body: some View {
        List {
            ForEach($notes){ note in
                VStack{
                    note
                }
            }
        }
    }
}

#Preview {
    AlliCloudNotesView()
        .modelContainer(notesContainer)
}
