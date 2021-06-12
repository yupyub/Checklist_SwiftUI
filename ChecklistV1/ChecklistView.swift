//
//  ContentView.swift
//  ChecklistV1
//
//  Created by yup on 2021/05/28.
//

import SwiftUI

struct ChecklistView: View {
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklist.items){
                    checklistItem in
                    RowView(checklistItem : checklistItem)
                } // End of ForEach
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
            } // End of list
            .navigationBarItems(
                leading: Button(action: {self.newChecklistItemViewIsVisible = true}){
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton())
            .navigationBarTitle("Checklist")
            .onAppear(){
                self.checklist.printChecklistContents()
            }
        } // End of NavigationView
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            //Text("New item screen coming soon!")
            NewChecklistItemView(checklist: self.checklist)
        }
    } // End of Body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
