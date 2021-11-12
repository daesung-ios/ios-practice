//
//  ContentView.swift
//  day4practice
//
//  Created by temp on 2021/11/04.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedData: String?
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("추가 정보를 입력해주세요")
                    .padding(.top, 27)
                    .padding(.bottom, 47)
                CardWithTitle("주택소유 여부 (본인/공동 명의)") {
                    CardSelection(selectedData: $selectedData, data: ["a", "b", "c"])
                }
            }
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
