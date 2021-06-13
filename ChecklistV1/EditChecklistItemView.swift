//
//  EditChecklistItemView.swift
//  ChecklistV1
//
//  Created by yup on 2021/06/05.
//

import SwiftUI

struct EditChecklistItemView: View {
    // Properties
    // ==========
    @Binding var checklistItem : ChecklistItem
    
    var body: some View {
        Form{
            TextField("Name", text: $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        } // End of Form
        .onAppear(){
            print("EditChecklistItemView has appeared!")
        } // End of .onAppear()
        .onDisappear(){
            print("EditChecklistItemView has disappeared!")
        } // End of .onDisappear()
    } // End of body
} // End of struct

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
