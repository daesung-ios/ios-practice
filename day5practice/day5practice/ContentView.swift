//
//  ContentView.swift
//  day5practice
//
//  Created by temp on 2021/11/05.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedData: String? = nil

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("직업을 선택해주세요")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .padding(.top, 27)
                    .padding(.bottom, 25)

                SelectCard(selectedData: $selectedData)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(15)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
