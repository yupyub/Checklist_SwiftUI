//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            Text("Walk the dog")
            Text("Brush my teeth")
            Text("Learn IOS development")
            Text("Soccer practice")
            Text("Eat Ice cream")
        } // End of body
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
