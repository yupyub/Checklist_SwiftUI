//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ChecklistItem {
    var name : String
    var isChecked : Bool = false
}

struct ContentView: View {
    //@State var checklistItems = ["Walk the dog","Brush my teeth","Learn IOS development","Soccer practice","Eat Ice cream"]
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn IOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat Ice cream", isChecked: true),
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems, id: \.self.name){
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        if checklistItem.isChecked {
                            Text("☑️")
                        }
                        else{
                            Text("⬛️")
                        }
                    }
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
