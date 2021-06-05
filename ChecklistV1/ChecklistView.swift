//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ChecklistView: View {
    //@State var checklistItems = ["Walk the dog","Brush my teeth","Learn IOS development","Soccer practice","Eat Ice cream"]
    @State var checklistItems = [
        ChecklistItem(name: "Walk the dog", isChecked: false),
        ChecklistItem(name: "Brush my teeth", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true),
        ChecklistItem(name: "Soccer practice", isChecked: false),
        ChecklistItem(name: "Walk the dog", isChecked: true),
    ]
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems){
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    } // End of HStack
                    .background(Color.white)
                    .onTapGesture{
                        //print("The user tapped a list view \(checklistItem.name).")
                        if let matchingIndex = self.checklistItems.firstIndex(where :{$0.id == checklistItem.id }){self.checklistItems[matchingIndex].isChecked.toggle() }
                        self.printChecklistContents()
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
        ChecklistView()
    }
}
