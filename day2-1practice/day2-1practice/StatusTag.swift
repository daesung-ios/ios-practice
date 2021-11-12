//
//  StatusTag.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

struct StatusTag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(Color(red: 41 / 255, green: 41 / 255, blue: 41 / 255, opacity: 0.5))
            .frame(minWidth: 0)
            .padding(.horizontal, 7)
            .padding(.vertical, 2)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 41 / 255, green: 41 / 255, blue: 41 / 255, opacity: 0.06)))
    }
}

extension View {
    func statusTag () -> some View {
        modifier(StatusTag())
    }
}

struct StatusTag_Previews: PreviewProvider {
    static var previews: some View {
        Text("example tag")
            .statusTag()
    }
}
