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
final class Notes: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var content: NoteContent
    
    ///Initializer
    init(id: UUID = UUID(), name: String, content: NoteContent, date: Date) {
        self.id = id
        self.name = name
        self.content = content
        self.date = date
    }
}

@Model
final class NoteContent {
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


@Model
final class TestModel {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
