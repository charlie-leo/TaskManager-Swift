//
//  Dialogs.swift
//  TaskManager Swift
//
//  Created by charles raj on 09/05/24.
//

import SwiftUI

struct Dialogs: View {
    var body: some View {
        VStack {
            
        }
        
    }
}

struct CreateTaskDialog : View {
    
    @State var selectedDate = Date()
    @State var datePickerAction: (Bool) -> ()
    @State var taskModel = Tasks()
    
    @State private var offset: CGFloat = 1000
    @State var onDismiss: () -> ()
    @State var onAdd: (_ taskModel : Tasks) -> ()

    
    @State private var date = Date()
    
    @State private var showDatePicker = false
    
    var body: some View {
        
        GeometryReader { parent in
            ZStack(alignment: .center, content: {
                
                ZStack(alignment: .leading){
                    VStack(alignment: .leading, content: {
                        
                        Text("Add Task ")
                            .foregroundColor(.black)
                            .font(Font.itim(size: 22))
                        
                        TextField("Task Name", text: $taskModel.taskName,
                                  onEditingChanged: { text in
                            
                        }, onCommit: { })
                            .font(Font.itim(size: 18))
                            .accentColor(.blue)
                            .foregroundColor(.black)
                            .padding()
                            .colorMultiply(.black)
                            .textInputAutocapitalization(.sentences)
                            .disableAutocorrection(true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1.0 )
                            )
                        
                        TextField("Task Details", text: $taskModel.taskDetails,
                                  onEditingChanged: {_ in
                        }, onCommit: { })
                            .font(Font.itim(size: 18))
                            .accentColor(.blue)
                            .foregroundColor(.black)
                            .padding()
                            .colorMultiply(.black)
                            .textInputAutocapitalization(.sentences)
                            .disableAutocorrection(true)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1.0 )
                            )
                    
//                        TextField("21/04/2024", text: $taskModel.taskDate,
//                                  onEditingChanged: {_ in
//                            
//                        }, onCommit: { })
//                            .font(Font.itim(size: 18))
//                            .accentColor(.blue)
//                            .foregroundColor(.black)
//                            .padding()
//                            .colorMultiply(.black)
//                            .textInputAutocapitalization(.sentences)
//                            .disableAutocorrection(true)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(.black, lineWidth: 1.0 )
//                            )
//                            .disabled(true)
//                            .onTapGesture {
//                                let date = datePickerAction(true)
//                            }
                        
//                        HStack (alignment: .center) {
//                            Image.addIcon
//                                .resizable()
//                                .scaledToFit()
//                                .colorMultiply(.black)
//                                .frame(width: 16, height: 16)
//                                .padding()
//                        }
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(.black, lineWidth: 1.0)
//                        )
                        
                        HStack(alignment: .center){
                            Spacer()
                            
                            ThemePrimaryButton(text: "Cancel", type: 1 , onSubmit: {
                                onDismiss()
                            })
                            
                            ThemePrimaryButton(text: "Add",type:  0 , onSubmit: {
                                onAdd(taskModel)
                            })
                            
                        }
                    })
                    
                }
                .zIndex(10)
                .padding(16)
                .frame(width: parent.size.width - 50)
                .background(.white)
                .cornerRadius(16)
                .shadow(radius: 10)
                .offset(x: 0, y: offset)
                .onAppear{
                    withAnimation(.spring()){
                        offset = 0
                    }
                }
                .onDisappear{
                    withAnimation(.spring()){
                        offset = 1000
                    }
                }
                
            })
            .frame(width: parent.size.width, height: parent.size.height)
            .background(.black.opacity(0.2))
            
        }
    }
}






@available(iOS 15.0, *)
struct CreateTaskDialog_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
//        CreateTaskDialog( onDismiss : {
//            print()
//        }, onAdd : {
//            
//        })
    }
}


//#Preview {
//    CreateTaskDialog()
//}
