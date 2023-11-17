//
//  NoteInfo.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 15/11/23.
//

import SwiftUI
import SwiftData

struct NoteInfo: View {
    @Query private var note: [Notes] = []
    
    
    
    
    var body: some View {
        HStack{
            Text("titolo")
        }
    }
}

#Preview {
    NoteInfo()
}
