//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog","Brush my teeth","Learn IOS development","Soccer practice","Eat Ice cream"]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems, id: \.self){
                    item in Text(item)
                        .onTapGesture{
                            self.checklistItems.append(item)
                            self.printChecklistContents()
                        }
                }
            } // End of list
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.printChecklistContents()
            }
        } // End of NavigationView
    } // End of Body
    
    // Method
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
