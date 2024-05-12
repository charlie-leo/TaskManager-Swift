//
//  TaskManager_SwiftApp.swift
//  TaskManager Swift
//
//  Created by charles raj on 25/04/24.
//

import SwiftUI

@main
struct TaskManager_SwiftApp: App {
    
    let store = NavigationStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

