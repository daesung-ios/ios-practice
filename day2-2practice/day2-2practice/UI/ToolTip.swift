//
//  Tooltip.swift
//  day2-2practice
//
//  Created by temp on 2021/11/09.
//

import SwiftUI

struct Tooltip: View {
    @State private var isHidden: Bool = true
    @State var offsetHeight: CGFloat = 0
    var text: String = "insert text"
    
    var body: some View {
        VStack {
            ZStack {
                Image("ic-tooltip")
                    .frame(width: 24, height: 24)
                    .onTapGesture(perform: { isHidden = !isHidden })
                    .zIndex(2)
                    .overlay(
                        Text("대출자가 부담하는 총 비용을 의미하며, 플랫폼 이용료 연 1.9%가 포함됩니다.")
                            .font(.system(size: 12))
                            .foregroundColor(Color.hex("78909d"))
                            .padding(10)
                            .cardStyle(cardStatus: .normal)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(width: 120)
                            .multilineTextAlignment(.center)
                            .onTapGesture(perform: { isHidden = !isHidden })
                            .background(GeometryReader { geometry in
                                Color.clear
                                    .onAppear {
                                        offsetHeight = geometry.size.height / 2 + 12
                                    }
                            })
                            .isHidden(isHidden)
                            .offset(y: offsetHeight)
                )
            }
        }
    }
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
        } else {
            self
        }
    }
}

struct Tooltip_Previews: PreviewProvider {
    static var previews: some View {
        Tooltip()
    }
}
