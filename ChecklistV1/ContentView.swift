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
                } // End of ForEach
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
            } // End of list
            .navigationBarItems(trailing: EditButton())
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
    
    func deleteListItem(whichElement: IndexSet){
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
