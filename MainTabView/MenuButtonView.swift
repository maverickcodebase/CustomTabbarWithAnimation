//
//  MenuButtonView.swift
//  Expense Ninja
//
//  Created by Sheraz Ahmed on 07/07/2024.
//

import SwiftUI

enum MenuButtonName: String, CaseIterable {
    case addTask = "Add Task"
    case addReminder = "Add Reminder"
    case addNote = "Add Note"
    
    var iconName: String {
        switch self {
        case .addTask:
            "checkmark.circle"
        case .addReminder:
            "bell"
        case .addNote:
            "note.text"
        }
    }
}

struct MenuButtonView: View {
    
   
    
    
    var body: some View {
            ButtonMenu(buttons: MenuButtonName.allCases) { button in
                switch button{
                    
                case .addTask:
                    print("Add Task")
                case .addReminder:
                    print("Add Reminder")
                case .addNote:
                    print("Add Note")
                }
            }
        
    }
}





#Preview {
    MenuButtonView()
}
