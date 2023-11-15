//
//  ContentView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment (\.modelContext) private var context
    ///access the same actor-bound context directly using the model container:
    //let context = container.mainContext
    
    
    var body: some View {
        NavigationStack {
            //to do: toolbar
            Text("prova 2")
            .navigationTitle("Folders")
            .toolbar{
                EditButton()
            }
        }
    }
}

#Preview {
    ContentView()
}
