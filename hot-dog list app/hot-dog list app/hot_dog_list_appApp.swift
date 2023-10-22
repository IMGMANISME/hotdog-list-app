//
//  hot_dog_list_appApp.swift
//  hot-dog list app
//
//  Created by GMAN's macbook on 2023/5/10.
//

import SwiftUI

/*
Model - data point
 
*/

@main
struct hot_dog_list_appApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
