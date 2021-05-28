//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog","Brush my teeth","Learn IOS development","Make Dinner","Do laundry","Pay bills","Finish homework","Change internet provider","Clean the kitchen","Wash the car","Wash the hair","Soccer practice","Eat Ice cream"]
    var body: some View {
        NavigationView{
            List{
                Text(checklistItems[0])
                    .onTapGesture{
                        self.checklistItems[0] = "Take the dog to the vet"
                    }
                Text(checklistItems[1])
                Text(checklistItems[2])
                Text(checklistItems[3])
                Text(checklistItems[4])
            } // End of list
            .navigationBarTitle("Checklist")
        } // End of NavigationView
    } // End of Body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
