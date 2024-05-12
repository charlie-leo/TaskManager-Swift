//
//  ThemeElements.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import SwiftUI

struct ThemeElements: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}





struct ThemePrimaryButton : View {
    
    private var text: String
    private var type: Int = 0 // 0 : Primary btn, 1 : Secondary btn
    @State var onSubmit: () -> ()
    @GestureState private var isPressed = false
    
    private var backgroundColor = Color.primaryBtn
    private var textColor = Color.white
    
    init(text: String, type: Int = 0, onSubmit: @escaping () -> Void) {
        self.text = text
        self.onSubmit = onSubmit
        self.type = type
        
        if (self.type == 0){
            self.backgroundColor = Color.primaryBtn
            self.textColor = Color.white
        } else {
            self.backgroundColor = Color.primaryLightColor
            self.textColor = Color.black
        }
        
    }
    
    var body: some View {
        
        Button(action: {
            onSubmit()
        }, label: {
            Text(text)
                .font(Font.itim(size: 18))
                .foregroundColor(textColor)
                .padding([.leading, .trailing], 15)
                .padding([.top, .bottom], 10)
        })
        .simultaneousGesture(TapGesture().updating($isPressed, body: { value, state, _ in
//               state = value
           }))
        .frame(alignment: .trailing)
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(radius: 5)
        .scaleEffect(isPressed ? 0.9 : 1.0)
        
    }
}

//#Preview {
//    ThemeElements()
//}
