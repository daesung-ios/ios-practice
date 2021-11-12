//
//  titledCardsArray.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

struct Section<Content: View>: View {
    var content: Content
    var title: String
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content()
    }
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .padding(.bottom, 15)
                content
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.horizontal, 15)
        }
    }
}

struct TitledCardsArray_Previews: PreviewProvider {
    static var previews: some View {
        Section(title: "example title") {
            Text("example content")
        }
    }
}
