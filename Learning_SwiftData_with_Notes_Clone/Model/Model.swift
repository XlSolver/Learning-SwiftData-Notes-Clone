//
//  Model.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 15/11/23.
//

import Foundation
import SwiftData
import SwiftUI

///Main storage class for notes
@Model
class Notes: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var Content: NoteContent
    
    ///Initializer
    init(id: UUID = UUID(), name: String, image: [Data], textField: String, date: Date) {
        self.id = id
        self.name = name
        self.Content = NoteContent(textField: textField, image: image)
        self.date = date
    }
}

@Model
class NoteContent {
    var textField: String
    var image: [Data] = []
    
    init(textField: String, image: [Data]) {
        self.textField = textField
        self.image = image
    }
}

struct Folders: Identifiable {
    var id = UUID()
    var name: String
}
