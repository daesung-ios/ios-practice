//
//  SelectTab.swift
//  day2-3practice
//
//  Created by temp on 2021/11/10.
//

import SwiftUI

struct SelectTab: View {
    @Binding var selectedData: String?
    var data: [String] = ["a", "b"]
    
    @State var tabWidth: CGFloat = 0
    
    var selectedTabIdx: Int {
        data.enumerated().first { $0.element == selectedData }?.offset ?? -1
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(data, id: \.self) { item in
                    Button(action: { selectedData = item }) {
                        Text(item)
                            .font(.system(size: 12))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(15)
                    }
                    .cardStyle(cardStatus: .notSelected)
                }
            }
            .cardStyle(cardStatus: .inactive)
            .background(GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        tabWidth = geometry.size.width / CGFloat(data.indices.count)
                    }
                    .onChange(of: geometry.size.width, perform: { width in
                        tabWidth = geometry.size.width / CGFloat(data.indices.count)
                    })
            })
            
            if let _selectedData = selectedData, tabWidth > 0 {
                HStack {
                    Text(_selectedData)
                        .font(.system(size: 12))
                        .padding(15)
                        .cardStyle(cardStatus: .focused)
                        .frame(minWidth: 0, maxWidth: tabWidth)
                        .offset(x: CGFloat(selectedTabIdx) * tabWidth)
                        .animation(.easeOut(duration: 0.3), value: _selectedData)
                    Spacer()
                }
            }
        }
    }
}

struct SelectTab_Previews: PreviewProvider {
    static var previews: some View {
        SelectTab(selectedData: .constant("a"))
    }
}
