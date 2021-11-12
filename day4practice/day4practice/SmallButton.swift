//
//  Button.swift
//  day4practice
//
//  Created by temp on 2021/11/04.
//

import SwiftUI

enum ButtonStatus {
    case selected
    case notSelected
}

struct SmallButton: ViewModifier {
    var buttonStatus: ButtonStatus = .notSelected
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(Color.blue/*color option*/)
            .frame(minWidth:0)
            .padding(.horizontal, 20)
            .padding(.vertical, 9)
            .background(RoundedRectangle(cornerRadius: 18)
                            .fill(Color.gray)
            )
                            
    }
}

extension View {
    func buttonStyle(buttonStatus: ButtonStatus) -> some View {
        modifier(SmallButton(buttonStatus: buttonStatus))
    }
}

struct SmallButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("text")
            .buttonStyle(buttonStatus: .selected)
    }
}
