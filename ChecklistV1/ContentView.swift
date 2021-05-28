//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("High priority")) {
                    Group{
                        Text("Walk the dog")
                        Text("Brush my teeth")
                        Text("Learn IOS development")
                        Text("Make Dinner")
                        Text("Do laundry")
                        Text("Pay bills")
                    }
                    Group{
                        Text("Finish homework")
                        Text("Change internet provider")
                        Text("Clean the kitchen")
                        Text("Wash the car")
                        Text("Wash the hair")
                    }
                }
                Section(header: Text("Low priority")) {
                    Text("Soccer practice")
                    Text("Eat Ice cream")
                }
            } // End of body
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Checklist")
        } // End of NavigationView
    } // End of Body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
