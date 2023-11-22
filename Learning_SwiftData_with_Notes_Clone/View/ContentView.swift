//
//  ContentView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 14/11/23.
//

import SwiftUI
import SwiftData




struct ContentView: View {
    @Environment (\.modelContext) private var context
    ///access the same actor-bound context directly using the model container:
    //let context = container.mainContext
    @Query var allNotes: [Notes]
    @State private var searchText: String = ""
    @State private var Title: String = ""
    @State private var TextContent: String = ""
    @State private var notesList: [Notes] = []
    @State private var foldersList: [Folders] = []
    @State var folderName: String = ""
    @State private var image: [Data] = []
    
    var body: some View {
        NavigationStack {
            //to do: Expandable list
            List{
                ///iCloud section
                Section {
                    NavigationLink(destination: AlliCloudNotesView()) {
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("All iCloud")
                        }
                    }
                    ///accessibility modifier
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("All notes")
                    NavigationLink(destination: NoteInfo()) {
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("Notes")
                        }
                    }
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Phone notes")
                    NavigationLink(destination: NoteInfo()) {
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("Fisica 1")
                        }
                    }
                    NavigationLink(destination: NoteInfo()) {
                        HStack{
                            Image(systemName: "trash")
                                .foregroundStyle(.yellow)
                            Text("Recently Deleted")
                        }
                    }
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Trash")
                } header: {
                    Text("iCloud")
                        .textCase(.none)
                        .font(.headline)
                    
                }
                .accessibilityAddTraits([.isHeader])
                .accessibilityLabel("iCloud list")
                Section{
                    
                } header: {
                    Text("Gmail")
                        .textCase(.none)
                        .font(.headline)
                }
                //                ForEach (folders){ folder in // Access the folders array from the Folders object
                //                    NavigationLink(destination: folder.view){
                //                        Text(folder.name)
                //                    }
                //                }
                
            }
            .accessibilityAddTraits([.isButton])
            .navigationTitle("Folders")
            .toolbar{
                EditButton()
                    .accessibilitySortPriority(1)
                    .accessibilityAddTraits([.isButton])
                    .foregroundStyle(.yellow)
                    .accessibilityLabel("Edit")
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Image(systemName: "folder.badge.plus")
                        .foregroundStyle(.yellow)
                    
                    NavigationLink(destination: CreateNewNoteView()) {
                        Image(systemName: "square.and.pencil")
                        
                        
                    }
                    .accessibilityAddTraits([.isButton])
                    .foregroundStyle(.yellow)
                    .accessibilityLabel("New folder")
                }
            }
            .searchable(text: $searchText)
            .accessibilityHint("Double tap to open the keyboard")
            .accessibilityLabel("Search")
            
            
        }
        .accessibilitySortPriority(1)
        .accessibilityAddTraits([.isHeader])
        .accentColor(.yellow)
        .accessibilityLabel("Folders")
    }
}


#Preview {
    ContentView()
        .modelContainer(notesContainer)
}


//folders: .constant([Folder(name: "All iCloud", view: AnyView(Text("View 1")))])
//using a binding, to create a preview i need to give a preview to this folder, since it is a binding i need to give a value this way that is costant




