//
//  CardViewModifier.swift
//  day2-practice
//
//  Created by temp on 2021/11/03.
//

import SwiftUI

enum CardStatus {
    case normal
    case focus
    case disabled
    case error
}

extension CardStatus {
    var color: Color {
        switch self {
        case .normal: return Color.gray
        case .focus: return Color.blue
        case .disabled: return Color.gray
        case .error: return Color.red
        }
    }
    
}

struct CardViewModifier: ViewModifier {
    var cardStatus: CardStatus = .normal
    
    func body(content: Content) -> some View {
        content
            .overlay(RoundedRectangle(cornerRadius: 4)
                        .stroke(cardStatus.color, lineWidth: 1))
    }
}

extension View {
    func cardStyle(_ cardStatus: CardStatus) -> some View {
        modifier(CardViewModifier(cardStatus: cardStatus))
    }
}

struct CardViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextField("test", text: .constant("test"))
            .cardStyle(.focus)
    }
}
