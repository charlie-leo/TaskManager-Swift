//
//  NavigationStore.swift
//  TaskManager Swift
//
//  Created by charles raj on 28/04/24.
//

import Foundation

class NavigationStore : ObservableObject {
    
    @Published var state: NavigationState = .splashScreen
    
    
    func dispatch(_ action: NavigationAction){
        state = navigationReducer(state: state, action: action)
    }
        
    func navigationReducer(state : NavigationState, action: NavigationAction) -> NavigationState {
        
        switch action {
        case .navigateToSplashScreen :
            return .splashScreen
        case .navigateToHome :
            return .homeScreen
        }
    }
    
}
