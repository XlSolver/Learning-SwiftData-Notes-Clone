//
//  TestView.swift
//  Learning_SwiftData_with_Notes_Clone
//
//  Created by Salvatore Flauto on 21/11/23.
//

import SwiftUI

struct TestView: View {
    var test: TestModel
    
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TestView(test: TestModel(name: "sdasda"))
}
