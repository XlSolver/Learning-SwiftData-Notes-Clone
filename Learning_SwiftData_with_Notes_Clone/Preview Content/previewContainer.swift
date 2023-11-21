//
//  previewContainer.swift
//  MC-1-Hunters
//
//  Created by Alexandr Chubutkin on 24/10/23.
//

import Foundation
import SwiftData
import SwiftUI

let previewContainer: ModelContainer = {
    do {
        let schema = Schema([
            Notes.self,
            NoteContent.self,
            TestModel.self
        ])
        
        let container = try ModelContainer(for: schema, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            let context = container.mainContext
            
            (0...9).forEach({ _ in
                let note = Notes(name: "Test 1", content: NoteContent(textField: "testsetstset", image: []), date: Date.now)
                context.insert(note)
            })
        }
        
        return container
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()
