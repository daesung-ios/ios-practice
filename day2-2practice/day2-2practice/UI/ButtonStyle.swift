//
//  Button.swift
//  day2-2practice
//
//  Created by temp on 2021/11/09.
//

import SwiftUI

enum ButtonStatus {
    case active
    case inactive
}

extension ButtonStatus {
    var buttonColor: Color {
        switch self {
        case .active: return Color.hex("ea3392")
        case .inactive: return Color.hex("f4bbdb")
        }
    }
}

struct ButtonStyle: ViewModifier {
    var buttonStatus: ButtonStatus
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 4)
                            .fill(buttonStatus.buttonColor))
    }
}

extension View {
    func buttonStyle(buttonStatus: ButtonStatus) -> some View {
        modifier(ButtonStyle(buttonStatus: buttonStatus))
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            Button(action: {}) {
                Text("active")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
                .buttonStyle(buttonStatus: .active)
            Text("inactive")
                .buttonStyle(buttonStatus: .inactive)
        }
        .padding(15)
    }
}
