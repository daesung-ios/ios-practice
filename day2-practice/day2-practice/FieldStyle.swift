//
//  FieldStyle.swift
//  day2-practice
//
//  Created by temp on 2021/11/03.
//

import SwiftUI



struct FieldStyle: ViewModifier {
    var cardStatus: CardStatus = .normal
    
    func body(content: Content) -> some View {
        content
            .font(.system(size:18))
            .padding(20)
            .frame(height: 64)
            .frame(minWidth: 0, maxWidth: .infinity)
            .cardStyle(cardStatus)
    }
}

extension View {
    func fieldStyle(_ cardStatus: CardStatus) -> some View {
        self.modifier(FieldStyle(cardStatus: cardStatus))
    }
}

struct FieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("test")
            .fieldStyle(.normal)
    }
}
