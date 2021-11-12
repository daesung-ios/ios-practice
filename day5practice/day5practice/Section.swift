//
//  Section.swift
//  day5practice
//
//  Created by temp on 2021/11/05.
//

import SwiftUI

struct Section<Content: View>: View {
    var title: String
    var content: () -> Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content){
        self.title = title
        self.content = content
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                if title != "" {
                    Text(title)
                    .font(.system(size:11))
                    .foregroundColor(Color.hex("b0bec5"))
                    .padding(.bottom, 5)
                }
                content()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

struct Section_Previews: PreviewProvider {
    static var previews: some View {
        Section("example") {
            Text("Section")
        }
    }
}
