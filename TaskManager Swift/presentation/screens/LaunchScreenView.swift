//
//  LaunchScreenView.swift
//  TaskManager Swift
//
//  Created by charles raj on 25/04/24.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @EnvironmentObject var store: NavigationStore
    
    var body: some View {
        
        VStack {
            Image("LogoIcon")
                .resizable().aspectRatio(contentMode:.fit).frame(width: 200, height: 200)
                .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primaryLightColor)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                store.dispatch(.navigateToHome)
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}

//struct LaunchScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchScreenView()
//    }
//}
