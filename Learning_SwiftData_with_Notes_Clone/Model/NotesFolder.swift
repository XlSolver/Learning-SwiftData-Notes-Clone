//
//  NotesFolder.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 16/11/23.
//

import Foundation
import SwiftUI


struct Folder: Identifiable {
    let id = UUID()
    var name: String
    var view: AnyView
    
    init(name: String, view: AnyView) {
        self.name = name
        self.view = view
    }
}

struct FoldersView: View {
    var folders: [Folder]
    
    var body: some View {
        List(folders) { folder in
            NavigationLink(destination: folder.view){
                Text(folder.name)
            }
        }
    }
}

struct ContentFolderView: View {
    var folders = [
        Folder(name: "All iCloud", view: AnyView(Text("View 1"))),
        Folder(name: "Notes", view: AnyView(Text("View 2"))),
        Folder(name: "Fisica 1", view: AnyView(Text("View 3"))),
        Folder(name: "Recently Deleted", view: AnyView(Text("View 4"))),
    ]
    
    var body: some View {
        FoldersView(folders: folders)
            
    }
}
