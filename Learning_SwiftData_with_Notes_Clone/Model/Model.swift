//
//  Model.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 15/11/23.
//

import Foundation
import SwiftData

///Main storage class for notes
@Model
class Notes {
    var id = UUID()
    var name: String
    var textField: String
    var image: [Data] = []
    var date: Date
    ///Initializer
    init(id: UUID = UUID(), name: String, textField: String, image: [Data], date: Date) {
        self.id = id
        self.name = name
        self.textField = textField
        self.image = image
        self.date = date
    }
}
