//
//  CardStyle.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: Color.hex("eceff1"), radius: 1, y: 3))
    }
}

extension View {
    func card() -> some View {
        modifier(CardStyle())
    }
}

struct CardStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("text")
                .font(.system(size: 10))
            Text("text2")
                .font(.system(size: 10))
        }
        .card()
    }
}
