//
//  ContentView.swift
//  day2-practice
//
//  Created by temp on 2021/11/03.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    
    var textActivity: CardStatus {
        if text.count > 3 { return .error }
        if isEditing { return .focus }
        else { return .normal }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("본인임을 확인해주세요")
                    .font(Font.system(size:22))
                    .padding(.top, 27)
                    .padding(.bottom, 47)
                TextField("이름", text: $text) { isEditing in
                    self.isEditing = isEditing
                }
                .fieldStyle(textActivity)
                .animation(.linear(duration: 1), value: textActivity)
                TextField("주민등록번호", text: $text)
                    .fieldStyle(.normal)
                TextField("휴대폰번호", text: $text)
                    .fieldStyle(.normal)
                    .padding(.bottom, 10)
                Text("휴대폰통신사")
                    .font(Font.system(size:11))
                    .padding(5)
                HStack {
                    Text("SKT")
                }
            }
            .frame(minWidth: 250, maxWidth: .infinity)
        }
        .padding(.horizontal, 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
