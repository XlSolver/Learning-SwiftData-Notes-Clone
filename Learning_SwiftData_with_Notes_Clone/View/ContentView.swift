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
    
    
    
    var body: some View {
        NavigationStack {
            //to do: Expandable list
            List{
                Section {
                    NavigationLink(destination: NoteInfo()) {
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("All iCloud")
                        }
                    }
                    NavigationLink(destination: NoteInfo()) {
                        HStack{
                            Image(systemName: "folder")
                                .foregroundStyle(.yellow)
                            Text("Notes")
                        }
                    }
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
                } header: {
                    Text("iCloud")
                        .textCase(.none)
                        .font(.headline)
                    
                }
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
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Folders")
            .toolbar{
                EditButton()
                    .foregroundStyle(.yellow)
            }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Image(systemName: "folder.badge.plus")
                        .foregroundStyle(.yellow)
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(.yellow)
                }
            }
            .searchable(text: $searchText)
        }
        
    }
}


#Preview {
    ContentView()
}


//folders: .constant([Folder(name: "All iCloud", view: AnyView(Text("View 1")))])
//using a binding, to create a preview i need to give a preview to this folder, since it is a binding i need to give a value this way that is costant

