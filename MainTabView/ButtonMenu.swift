//
//  ButtonMenu.swift
//  expense_ninja
//
//  Created by Sheraz Ahmed on 04/06/2025.
//

import Foundation
import SwiftUI

struct ButtonMenu: View {
    @State private var isExpanded: Bool = false
    let buttons: [MenuButtonName]
    var menuButtonAction: (MenuButtonName) -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.98))
                .opacity(isExpanded ? 1.0 : 0.0)
                .onTapGesture {
                    toggleMenu()
                }
            
            VStack {
                Spacer()
                ForEach(buttons.indices, id: \.self) { index in
                    menuItem(buttons[index], index: index)
                }
                mainButton
            }
            .padding()
            .offset(y: -25)
        }
    }
    
    private func toggleMenu() {
        withAnimation(.spring(response: 0.2, dampingFraction: 0.9, blendDuration: 0)) {
            isExpanded.toggle()
        }
    }
    
    private func menuItem(_ button: MenuButtonName, index: Int) -> some View {
        Button(action: {
            menuButtonAction(button)
            toggleMenu()
        }) {
            HStack(spacing: 15) {
                Image(systemName: button.iconName)
                
                Text(button.rawValue)
                    .font(.subheadline)
                    .foregroundStyle(Color(.label))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(.systemBackground))
            )
        }
        .buttonStyle(PlainButtonStyle())
        .offset(
            x: 0,
            y: isExpanded ? 0 : -CGFloat(index - 2) * 55
        )
        .opacity(isExpanded ? 1 : 0)
        .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.1), value: isExpanded)
    }
    
    private var mainButton: some View {
        Button(action: {
            toggleMenu()
        }) {
            Image(systemName: "plus")
                .scaleEffect(1.5)
                .foregroundStyle(Color(.white))
                .rotationEffect(.degrees(isExpanded ? 135 : 0))
        }
        .frame(width: 50, height: 50)
        .background(Color(.main))
        .clipShape(Circle())
        .shadow(radius: 5)
    }
}




#Preview {
    VStack{
        Spacer()
        ButtonMenu(buttons: MenuButtonName.allCases) { button in
            switch button{
                
            case .addTask: break
            case .addReminder: break
            case .addNote: break
                
            }
        }
    }
    .padding()
}