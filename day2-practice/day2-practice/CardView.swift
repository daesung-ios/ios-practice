//
//  CardView.swift
//  day2-practice
//
//  Created by temp on 2021/11/03.
//

import SwiftUI

struct Card<Content: View>: View {
    var content: Content
    var cardStatus: CardStatus
    
    init(cardStatus: CardStatus, @ViewBuilder content: @escaping () -> Content){
        self.content = content()
        self.cardStatus = cardStatus
    }
    
    var body: some View {
        content
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Card(cardStatus: .error) {
            TextField("test", text: .constant("test"))
        }
        .cardStyle(.normal)
    }
}
