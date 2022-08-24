//
//  HomeView.swift
//  Diary master
//
//  Created by Евгений Воронов on 09.08.2022.
//

import SwiftUI

struct HomeView: View { // TODO: rename it to the Home view
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedTabBarItem == .calendar {
                    DateScreen(currentDate: $viewModel.currentDate)
                    
                }  else if viewModel.selectedTabBarItem == .client {
                    ClientView()
                    
                }  else if viewModel.selectedTabBarItem == .services {
                    ServicesView()
                } else if viewModel.selectedTabBarItem == .settings {
                    SettingsView()
                }
                
            }
            .padding()
            .background(
                Image("login fon4")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width - 0, height: UIScreen.main.bounds.height - 0).ignoresSafeArea(.all))
            .navigationBarHidden(true)
        }
        .overlay(content: {
            TabBar(tabBarItem: $viewModel.selectedTabBarItem)
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

final class HomeViewModel: ObservableObject {
    
    @Published var selectedTabBarItem: TabBarItem = .calendar
//    @Published var selectedClientView: TabBarItem = .client
//    @Published var selectServices: TabBarItem = .services
    
    // properties for every screen with saved state
    
    
    // calendar view
    @Published var currentDate = Date()

    
    
}


enum TabBarItem {
    case calendar
    case client
    case services
    case settings
    
    var title: String {
        switch self {
        case .calendar:
            return "calendar"
        case .client:
            return "clients"
        case .services:
            return "services"
        case .settings:
            return "settings"
        }
    }
    
}
