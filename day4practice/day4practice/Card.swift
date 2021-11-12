//
//  Card.swift
//  day4practice
//
//  Created by temp on 2021/11/04.
//

import SwiftUI

enum CardType {
    case selected
    case notSelected
    case background
}

extension CardType {
    var frameColor: Color {
        switch self {
        case .selected: return Color.hex("263238")
        case .notSelected: return Color.clear
        case .background: return Color.hex("d0d8dc")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .selected: return Color.hex("ffffff")
        case .notSelected: return Color.clear
        case .background: return Color.hex("eceff1")
        }
    }
    
    var textColor: Color? {
        switch self {
        case .selected: return Color.hex("263238")
        case .notSelected: return Color.hex("b0bec5")
        case .background: return nil
        }
    }
}

struct CardStyle: ViewModifier {
    var cardType: CardType = .notSelected
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(cardType.textColor)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 4)
                            .fill(cardType.backgroundColor)
                            .shadow(color: cardType == .selected ? Color.hex("263238").opacity(0.2) : Color.clear, radius: 1, y: 2))
            .background {
                RoundedRectangle(cornerRadius: 4).stroke(cardType.frameColor, lineWidth: 1)
            }
    }
}

extension View {
    func cardStyle(_ cardType: CardType) -> some View {
        modifier(CardStyle(cardType: cardType))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Text("hi")
            .cardStyle(.selected)
    }
}
