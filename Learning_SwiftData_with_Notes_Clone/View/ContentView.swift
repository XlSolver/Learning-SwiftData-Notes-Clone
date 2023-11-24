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
    @State private var revealDetailsiCloud: Bool = false
    @State private var revealDetailsGmail: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            
            List{
                ///Expandable group for icloud
                DisclosureGroup("iCloud",isExpanded: $revealDetailsiCloud) {
                    //need to set disc group label bold but not children items
                    ///iCloud section
                    //                    Section {
                    
                    NavigationLink(destination: AlliCloudNotesView()) {
                        ///System image and text
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
                        ///System image and text
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("Notes")
                        }
                    }
                    ///accessibility modifier
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Phone notes")
                    NavigationLink(destination: NoteInfo()) {
                        ///System image and text
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("Fisica 1")
                        }
                    }
                    NavigationLink(destination: NoteInfo()) {
                        ///System image and text
                        HStack{
                            Image(systemName: "trash")
                                .foregroundStyle(.yellow)
                            Text("Recently Deleted")
                        }
                    }
                    ///accessibility modifier
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Trash")
                    //                    } header: {
                    //                        ///List identifier
                    //                        Text("iCloud")
                    //                            .foregroundStyle(Color("TextColor"))
                    //                            .textCase(.none)
                    //                            .font(.callout)
                    //                            .bold()
                    //                    }
                }
                .listRowBackground(Color.clear)
                
                
                
                
                
                ///accessibility modifier
                //                .accessibilityAddTraits([.isHeader])
                //                .accessibilityLabel("iCloud list")
                DisclosureGroup("Gmail", isExpanded: $revealDetailsGmail) {
                    
                }
                .listRowBackground(Color.clear)
                //                ForEach (folders){ folder in // Access the folders array from the Folders object
                //                    NavigationLink(destination: folder.view){
                //                        Text(folder.name)
                //                    }
                //                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Folders")
            .toolbar{
                ToolbarItemGroup{
                    EditButton()
                        .foregroundStyle(.yellow)
                    ///accessibility modifier
                        .accessibilitySortPriority(1)
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Edit")
                }
                ToolbarItemGroup(placement: .bottomBar){
                    Image(systemName: "folder.badge.plus")
                        .foregroundStyle(.yellow)
                        .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("New folder")
                    
                    NavigationLink(destination: CreateNewNoteView()) {
                        Image(systemName: "square.and.pencil")
                    }
                    .foregroundStyle(.yellow)
                    ///accessibility modifier
                    .accessibilityAddTraits([.isButton])
                    .accessibilityLabel("New note")
                    
                    
                }
            }
            .searchable(text: $searchText){
                
            }
        }
        .accentColor(.yellow)
        ///accessibility modifier
        .accessibilitySortPriority(1)
        .accessibilityAddTraits([.isHeader])
        .accessibilityLabel("Folders")
    }
}


#Preview {
    ContentView()
        .modelContainer(notesContainer)
}


//folders: .constant([Folder(name: "All iCloud", view: AnyView(Text("View 1")))])
//using a binding, to create a preview i need to give a preview to this folder, since it is a binding i need to give a value this way that is costant




