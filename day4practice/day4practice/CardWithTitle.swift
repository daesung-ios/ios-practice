//
//  CardWithTitle.swift
//  day4practice
//
//  Created by temp on 2021/11/04.
//

import SwiftUI

struct CardWithTitle<Content: View>: View {
    var title: String
    var content: Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(Color.hex("b0bec5"))
                .padding(5)
            content
        }
    }
}

struct CardWithTitle_Previews: PreviewProvider {
    static var previews: some View {
        CardWithTitle("example") { CardSelection(selectedData: .constant("a"), data: ["a", "b", "c"])
        }
    }
}
