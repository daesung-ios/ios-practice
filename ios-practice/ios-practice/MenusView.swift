//
//  MenusView.swift
//  ios-practice
//
//  Created by temp on 2021/11/02.
//

import SwiftUI

struct MenuBlock<Content: View>: View{
    var title: String
    var content: () -> Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content){
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            content()
        }
    }
}

struct MenusView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBlock("인기 YOUTUBE") {
            ForEach(["음악", "스포츠", "게임"], id: \.self) { title in
                Text(title)
            }
        }
    }
}
