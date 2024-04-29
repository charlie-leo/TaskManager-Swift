//
//  ContentView.swift
//  TaskManager Swift
//
//  Created by charles raj on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresentingDetailView = false
    
    var body: some View {
        NavigationView {
            VStack(){
                Text("Main View")
                    .font(.body)
            }
                    .navigationTitle("Main")
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               Button(action: {
                                isPresentingDetailView = true
                               }) {
                               Image(systemName: "plus")
                               }
                           }
                       }
               }
        .sheet(isPresented: $isPresentingDetailView) {
                            DetailView()
                        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: TaskView() ){
                        Image(systemName: "plus")
                    }
                }
            }
    }
}

struct TaskView: View {
    var body: some View {
        Text("Task View")
            .navigationTitle("Task")
            
    }
}

#Preview {
    ContentView()
}
