//
//  Learning_SwiftData_with_Notes_CloneApp.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 14/11/23.
//

import SwiftUI
import SwiftData

let configurationNotes = ModelConfiguration(isStoredInMemoryOnly: false, allowsSave: true) //isStoredInMemoryOnly creates a dummy container! if true it doesn't store data permanetly!!!

let notesContainer: ModelContainer = {
    let schema = Schema([Notes.self, NoteContent.self, TestModel.self])
    let container = try! ModelContainer(for: schema, configurations: configurationNotes)
    
    return container
}() 


@main
struct Learning_SwiftData_with_Notes_CloneApp: App {
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(notesContainer)
    }
}
