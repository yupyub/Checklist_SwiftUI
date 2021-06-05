//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.checklistItems){
                    checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "☑️" : "⬛️")
                    } // End of HStack
                    .background(Color.white)
                    .onTapGesture{
                        //print("The user tapped a list view \(checklistItem.name).")
                        if let matchingIndex = self.checklist.checklistItems.firstIndex(where :{$0.id == checklistItem.id }){self.checklist.checklistItems[matchingIndex].isChecked.toggle() }
                        self.checklist.printChecklistContents()
                    }
                } // End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            } // End of list
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        } // End of NavigationView
    } // End of Body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
