//
//  MenusView2.swift
//  ios-practice
//
//  Created by temp on 2021/11/02.
//

import SwiftUI

struct MenuBlock2<Content: View>: View {
    var title: String
    var content: () -> Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(title)
                .font(.system(size:20, weight: .bold))
            content()
        }
        .foregroundColor(.gray)
    }
}

struct MenusView2: View {
    var body: some View {
        MenuBlock2("인기 YOUTUBE") {
            ForEach(["음악", "스포츠", "게임", "영화"], id: \.self) { menu in
                Text(menu)
            }
        }
    }
}

struct MenusView2_Previews: PreviewProvider {
    static var previews: some View {
        MenusView2()
    }
}
