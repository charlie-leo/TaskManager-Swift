//
//  ContentView.swift
//  TaskManager Swift
//
//  Created by charles raj on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: NavigationStore
    
    var body: some View {
        VStack {
            switch store.state {
            case .splashScreen:
                LaunchScreenView()
            case .homeScreen:
                HomeScreenView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
