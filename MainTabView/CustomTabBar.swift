//
//  CustomTabBar.swift
//  Expense Ninja
//
//  Created by Sheraz Ahmed on 29/06/2024.
//

import SwiftUI


struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        
        ZStack(alignment:.bottom) {
            
            tabItems
                .frame(height: 82)
                .background(
                    Rectangle()
                        .fill(.thinMaterial)
                        .mask(CurvedShape())
                )
            
            MenuButtonView()
        }
    }
    
    
    
    
    private var tabItems: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                tabItem(tab: tab)
                Spacer()
                
            }
        }
    }
    
    private func tabItem(tab: Tab) -> some View {
        VStack {
            if tab == selectedTab {
                Capsule()
                    .fill(Color(.main))
                    .frame(width: 30, height: 2)
                    .transition(.scale)
            }
            Spacer()
            VStack {
                if !tab.iconName.isEmpty {
                    Image(systemName: tab.iconName)
                        .foregroundStyle(tab == selectedTab ? Color(.main) : Color(.placeholderText))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                selectedTab = tab
                            }
                        }
                }
                Text(tab.rawValue)
                    .foregroundStyle(tab == selectedTab ? Color(.main): Color(.placeholderText))
                    .font(.system(size: 10))
            }
            Spacer()
        }
        .frame(width: 50)
    }
    
    
    
    struct CurvedShape: Shape {
        func path(in rect: CGRect) -> Path {
            let height: CGFloat = 50.0
            var path = Path()
            let centerWidth = rect.width / 2
            
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: centerWidth - height * 1.2, y: 0))
            path.addCurve(
                to: CGPoint(x: centerWidth, y: height),
                control1: CGPoint(x: centerWidth - 30, y: 0),
                control2: CGPoint(x: centerWidth - 35, y: height)
            )
            path.addCurve(
                to: CGPoint(x: centerWidth + height * 1.2, y: 0),
                control1: CGPoint(x: centerWidth + 35, y: height),
                control2: CGPoint(x: centerWidth + 30, y: 0)
            )
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.closeSubpath()
            
            return path
        }
    }
}




#Preview {
    
    CustomTabBar(selectedTab: .constant(.home))
}

