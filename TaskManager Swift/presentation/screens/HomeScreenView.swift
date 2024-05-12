//
//  HomeScreenView.swift
//  TaskManager Swift
//
//  Created by charles raj on 28/04/24.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let label: String
    let systemName: String
}

//@available(iOS 15.0, *)
struct HomeScreenView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    @State private var openMenuLayout = true
    @State private var showCreateDialog = false
    @State private var cItem = ["item 1", "item 2", "item 3"]
    let items = [
         Item(label: "Label 1", systemName: "square"),
         Item(label: "Label 2", systemName: "circle"),
         Item(label: "Label 3", systemName: "triangle")
     ]
    
    var body: some View {
        
        GeometryReader { parent in
            
            HStack(alignment: .center){
                Image.profileIcon
                    .resizable().aspectRatio(contentMode:.fit).frame(width: 60, height: 60)
//                    .clipShape(Circle())
                    .cornerRadius(30)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 0)
            }
            .frame(width: parent.size.width, height: 60, alignment: Alignment.trailing)
            .background(Color.primaryLightColor)
            
            Image.logoImage
                .resizable().aspectRatio(contentMode:.fit).frame(width: 80, height: 80)
                .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 0)
                .cornerRadius(40)
                .padding([.top], 20)
            
            VStack (alignment: .leading ) {
                Text("My Tasks")
                    .font(Font.itim(size: 20))
                    .foregroundColor(Color.black)
            
                if homeViewModel.taskList.count > 0 {
                    List {
                        ForEach (homeViewModel.taskList, id: \.self) { task in
                            TaskItem(task: task, isChecked: false, onChecked: { isChecked in
                                print("Outer is Checked")
                                if (isChecked){
                                    homeViewModel.homeEvents(event: HomeEvents.completeTask(task))
                                }
                                
                            }, onOpenTask: {
                                print("Outer is opened")
                            })
                            .padding([.top,.bottom],10)
                            .padding([.leading,.trailing], 3)
                            .listRowSpacing(0)
                            .listRowBackground(Color.white)
                        }
                        .listRowSeparator(Visibility.hidden)
                        .listRowSpacing(0)
                        .listRowInsets(EdgeInsets())
                        
                    }
                    .padding(0)
                    .listStyle(.plain)
                    .background(Color.white.opacity(0.3))
                } else {
                    Color.clear
                }
                
                Text("Completed Tasks")
                    .font(Font.itim(size: 20))
                    .foregroundColor(Color.black)
                
                if homeViewModel.completedTaskList.count > 0 {
                    List {
                        ForEach (homeViewModel.completedTaskList, id: \.self) { item in
                            TaskItem(task: item, isChecked: true, onChecked: { isChecked in
                                print("Outer is Checked")
                                if (!isChecked){
                                    homeViewModel.homeEvents(event: HomeEvents.completeNotTask(item))
                                }
                            }, onOpenTask: {
                                print("Outer is opened")
                            })
                            .padding([.top,.bottom],10)
                            .padding([.leading,.trailing], 3)
                            .listRowBackground(Color.white)
                            
                        }
                        .listRowSeparator(Visibility.hidden)
                        .listRowInsets(EdgeInsets())
                        .background{
                            Color.white
                        }
                    }
                    .background{
                        Color.clear
                    }
                    .frame(height: 130)
                    .listStyle(.plain)
                } else {
                    Color.clear
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .padding([.top], 80)
         
            Button(action: {
                print("FAb")
                showCreateDialog = true
            }) {
                Image.addIcon
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 6, height: 6, alignment: Alignment.center)
                    .foregroundColor(.white)
                    .padding(10)
                
            }
            .buttonStyle(FloatingActionButtonStyle())
            .frame(alignment: Alignment.bottomTrailing)
            .padding([.top], parent.size.height - 100)
            .padding([.leading], parent.size.width - 100 )
        
            
            
            if showCreateDialog {
                CreateTaskDialog(onDismiss: {
                    print("Dismiss Tapped ")
                    showCreateDialog = false
                }, onAdd: {taskModel in
//                    let taskId = TaskTable.shared.insert(task: taskModel)
                    
                homeViewModel.homeEvents(event: HomeEvents.addTask(taskModel))
                    showCreateDialog = false
                    
                })
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        
    }
}


struct Menu: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.width / 2
    }
}
extension HorizontalAlignment {
    static let menu = Self(Menu.self)
}

struct TaskItem: View {
    
    @State var task: Tasks
    @State var isChecked : Bool = false
    @State var onChecked: (Bool) -> ()
    @State var onOpenTask: () -> ()
    
//    init(task: Tasks, isChecked: Bool, onChecked: @escaping () -> Void, onOpenTask: @escaping () -> Void) {
//        self.task = task
//        self.isChecked = isChecked
//        self.onChecked = onChecked
//        self.onOpenTask = onOpenTask
//    }
    
    
    var body : some View {
        HStack (alignment: .center, spacing: 10) {
            HStack{
                
            }
            .frame(width: 10)
            
            Toggle(isOn: $isChecked, label: {
//                Text(task.taskName)
            })
            .toggleStyle(CheckboxStyle())
            .onTapGesture {
                isChecked = !isChecked
                onChecked(isChecked)
                print("Check box tapped")
            }
            
            Text(task.taskName)
            
            Spacer()
            Spacer()
            
            Image.fileIcon
                .frame(width: 13, height: 13)
                .padding(3)
                .background{
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(.gray.opacity(0.3))
                }
                .overlay(alignment: .bottomLeading, content: {
                    Text("5")
                        .foregroundColor(.black)
                        .frame(width: 10, height: 10)
                        .background{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white.opacity(1))
                        }
                        .font(Font.itim(size: 10))
                })
            
            HStack{
                
            }
            .frame(width: 10, height: .leastNonzeroMagnitude)
        }
        .frame(width: .infinity,
               height: 50,
               alignment: Alignment.leading)
        .background(.white)
        .foregroundColor(.black)
        .cornerRadius(10)
        .shadow(radius: 2)
        .onTapGesture {
            isChecked = isChecked
            print()
            onOpenTask()
        }
        
    }
}

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                configuration.label
            }
        }
    }
}

struct FloatingActionButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .padding()
            .background(Color.primaryColor)
            .foregroundColor(.primaryColor)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .shadow(radius: 5)
    }
}



@available(iOS 15.0, *)
#Preview {
    HomeScreenView()
}

//PlaygroundPage.current.setLiveView(HomeScreenView())
@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        HomeScreenView()

    }

}
