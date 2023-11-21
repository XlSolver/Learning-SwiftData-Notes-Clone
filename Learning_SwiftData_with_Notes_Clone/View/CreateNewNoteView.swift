//
//  CreateNewNoteView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 17/11/23.
//

import SwiftUI
import SwiftData

struct CreateNewNoteView: View {
    @Environment (\.modelContext) private var context
    @State private var Title: String = ""
    @State private var image: [Data] = []
    @State private var TextContent: String = ""
    @State private var fullText: String = ""
    @FocusState private var toolbarVisibile: Bool
    
    
    var body: some View {
        NavigationStack {
            ///The notes app is able to create a title automatically
            TextField("", text: $Title)
                .font(.title)
                .bold()
                .foregroundStyle(.black)
            ///Text editor to allow user to fill an infinite page that support different formats
            TextEditor(text: $fullText)
                .focused($toolbarVisibile)
                .toolbar{
                    ToolbarItemGroup(placement: .topBarTrailing){
                        Button(action: shareButton) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.yellow)
                        }
                        Button(action: addNote){
                            Image(systemName: "ellipsis.circle")
                                .foregroundStyle(.yellow)
                        }
                    }
                    ToolbarItemGroup(placement: .keyboard){
                        HStack {
                            Button("text format", systemImage: "textformat.alt") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            .foregroundStyle(.gray)
                            Spacer()
                            Button("Checklist", systemImage: "checklist") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            .foregroundStyle(.gray)
                            Spacer()
                            Button("table grid", systemImage: "table"){
                                
                            }
                            .foregroundStyle(.gray)
                            Spacer()
                            Button("camera", systemImage: "camera"){
                                
                            }
                            .foregroundStyle(.gray)
                            Spacer()
                            Button("Hand input", systemImage: "pencil.tip.crop.circle"){
                                
                            }
                            .foregroundStyle(.gray)
                            Spacer()
                            Button("Close", systemImage: "xmark"){
                                
                            }
                            .foregroundStyle(.gray)
                        }
                        
                    }
                }
                .foregroundStyle(.black)
        }
        .foregroundStyle(.yellow)
        
    }
    
    func addNote() {
        let newNote = Notes(name: Title, content: NoteContent(textField: "testetestestse", image: []), date: Date())
        context.insert(newNote)
        return
    }
    
    func shareButton() {
        print("Condividi")
        //            let url = URL(string: "https://www.swiftuiio.com/")
        //            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        //
        //            UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

#Preview {
    CreateNewNoteView()
        .modelContainer(previewContainer)
}
