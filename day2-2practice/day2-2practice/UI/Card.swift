//
//  Card.swift
//  day2-2practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

enum CardStatus {
    case normal
    case focused
    case inactive
    case error
    case noBorderLight
    case noBorderDark
}

extension CardStatus {
    var borderColor: Color {
        switch self {
        case .normal: return Color.hex("eceff1")
        case .focused: return Color.hex("263238")
        case .inactive: return Color.hex("d0d8dc")
        case .error: return Color.hex("ca0b0b")
        case .noBorderDark, .noBorderLight: return Color.clear
        }
    }
    var backgroundColor: Color {
        switch self {
        case .normal, .focused, .error: return Color.white
        case .inactive: return Color.hex("eceff1")
        case .noBorderLight: return Color.hex("f9fafa")
        case .noBorderDark: return Color.hex("eceff1")
        }
    }
    var shadowColor: Color {
        switch self {
        case .normal, .inactive, .noBorderDark, .noBorderLight: return Color.clear
        case .focused, .error: return Color(red: 38 / 255, green: 50 / 255, blue: 56 / 255).opacity(0.1)
        }
    }
}

struct Card: ViewModifier {
    var cardStatus: CardStatus
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 4).fill(cardStatus.backgroundColor))
            .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(cardStatus.borderColor,  lineWidth: 1))
            .shadow(color: cardStatus.shadowColor, radius: 4, y: 2)
            
    }
}

extension View {
    func cardStyle(cardStatus: CardStatus) -> some View {
        modifier(Card(cardStatus: cardStatus))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("normal")
                .padding(15)
                .cardStyle(cardStatus: .normal)
            Text("focused")
                .padding(15)
                .cardStyle(cardStatus: .focused)
            Text("inactive")
                .padding(15)
                .cardStyle(cardStatus: .inactive)
            Text("error")
                .padding(15)
                .cardStyle(cardStatus: .error)
            Text("noBorderLight")
                .padding(15)
                .cardStyle(cardStatus: .noBorderLight)
            Text("noBorderDark")
                .padding(15)
                .cardStyle(cardStatus: .noBorderDark)
        }
        .padding(15)
    }
}
