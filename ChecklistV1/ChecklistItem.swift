//
//  ChecklistItem.swift
//  ChecklistV1
//
//  Created by yup on 2021/06/05.
//

import Foundation

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name : String
    var isChecked : Bool = false
}
