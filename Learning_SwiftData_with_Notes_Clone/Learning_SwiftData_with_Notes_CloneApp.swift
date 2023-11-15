//
//  Learning_SwiftData_with_Notes_CloneApp.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 14/11/23.
//

import SwiftUI
import SwiftData

let configurationNotes = ModelConfiguration(isStoredInMemoryOnly: false, allowsSave: true)

let container = try! ModelContainer(for: Notes.self, configurations: configurationNotes)



@main
struct Learning_SwiftData_with_Notes_CloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
