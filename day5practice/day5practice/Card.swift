//
//  Card.swift
//  day5practice
//
//  Created by temp on 2021/11/05.
//

import SwiftUI

enum CardStatus {
    case selected
    case notSelected
}

extension CardStatus {
    var borderColor: Color {
        switch self {
        case .selected: return Color.hex("d0d8dc")
        case .notSelected: return Color.hex("d0d8dc")
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .selected: return Color.hex("eceff1")
        case .notSelected: return Color.hex("ffffff")
        }
    }
}

struct Card: ViewModifier {
    var cardStatus: CardStatus
    
    func body(content: Content) -> some View {
            HStack {
                content
                    .font(.system(size: 18))
                    .foregroundColor(Color.hex("263238"))
            }
            .padding(20)
            .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(cardStatus.borderColor, lineWidth: 1))
            .background(cardStatus.backgroundColor)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
}

extension View {
    func cardTypeButton (cardStatus: CardStatus) -> some View {
        modifier(Card(cardStatus: cardStatus))
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("example on")
                .cardTypeButton(cardStatus: .selected)
            Text("example off")
                .cardTypeButton(cardStatus: .notSelected)
        }
        
    }
}
