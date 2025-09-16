//
//  MainTabView.swift
//  expense_ninja
//
//  Created by Sheraz Ahmed on 04/06/2025.
//

import SwiftUI



struct MainTabView: View {
    
    @State private var tabSelected: Tab = .home
    
    init() {
        
        UITabBar.appearance().isTranslucent = true
                    let appearance = UITabBarAppearance()
                    appearance.configureWithTransparentBackground()
                    UITabBar.appearance().standardAppearance = appearance
                        UITabBar.appearance().scrollEdgeAppearance = appearance
                    
        
    }
    
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        view(for: tab)
                            .tag(tab)
                    }
                }
            }
            
            CustomTabBar(selectedTab: $tabSelected)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func view(for tab: Tab) -> some View {
        switch tab {
        case .home:
            Text("Home")
                .font(.largeTitle)
        case .tasks:
            Text("Tasks")
                .font(.largeTitle)
        case .add:
            Spacer()
        case .calendar:
            Text("Calendar")
                .font(.largeTitle)
        case .settings:
            Text("Settings")
                .font(.largeTitle)
        }
    }
}




enum Tab: String, CaseIterable {
    case home = "Home"
    case tasks = "Tasks"
    case add = ""
    case calendar = "Calendar"
    case settings = "Settings"
    
    
    
    
    var iconName: String {
            switch self {
            case .home:
                return "house"
            case .tasks:
                return "checklist"
            case .add:
                return ""
            case .calendar:
                return "calendar"
            case .settings:
                return "gearshape"
            }
        }
}


#Preview {
    MainTabView()
}


