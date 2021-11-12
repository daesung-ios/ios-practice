//
//  Card.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

// View는 멍청해야하기 때문에 모델을 알고있으면 안된다.

import SwiftUI

var exampleProduct: InvestmentProduct = .init(productNumber: "1", annualInterest: 13.5, timePeriod: 6, description: "개인신용 분산(선순위) 170", currentStatus: .new, thumbnailName: "building")
var exampleProduct2: InvestmentProduct = .init(productNumber: "1", annualInterest: 8.3, timePeriod: 6, description: "아파트 담보(서울시 서대문구) 444", currentStatus: .willOpenSoon, ddayStatus: "오픈 D-1")
var exampleProduct3: InvestmentProduct = .init(productNumber: "1", annualInterest: 14.1, timePeriod: 6, description: "부동산PF (제주 메디컬센터) 41차", currentStatus: .closed, ddayStatus: "done")

struct InvestmentProductCard: View {
    var title: String
    var description: String
    var currentStatus: InvestmentProductStatus
    var thumbnailName: String?
    var tagString: String?
    
    var mainTextColor: Color {
        switch currentStatus {
        case .new: return Color.hex("292929")
        case .willOpenSoon: return Color(red: 41 / 255, green: 41 / 255, blue: 41 / 255).opacity(0.8)
        case .closed: return Color(red: 41 / 255, green: 41 / 255, blue: 41 / 255).opacity(0.2)
        }
    }
    var descriptionTextOpacity: Double {
        switch currentStatus {
        case .new: return 0.8
        case .willOpenSoon: return 0.6
        case .closed: return 0.2
        }
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                }
                .font(.system(size: currentStatus == .new ? 18 : 16, weight: currentStatus == .closed ? .regular : .bold))
                .foregroundColor(mainTextColor)
                .padding(.bottom, 4)
                
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 41 / 255, green: 41 / 255, blue: 41 / 255).opacity(descriptionTextOpacity))
            }
            Spacer()
            if let _thumbnailName = thumbnailName {
                Image(_thumbnailName)
                    .frame(width: 52, height: 52)
                    .clipShape(Circle())
            } else {
                if let _tagString = tagString {
                    Text(_tagString).statusTag()
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 24)
        .card()
    }
}

extension InvestmentProductCard {
    init(product: InvestmentProduct) {
        self.description = product.description
        self.currentStatus = product.currentStatus
        self.title = "연 \(product.annualInterest)% \(product.timePeriod)개월"
        self.thumbnailName = product.thumbnailName
        self.tagString = product.ddayStatus == "done" ? "SOLD OUT" : product.ddayStatus
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InvestmentProductCard(product: exampleProduct)
            InvestmentProductCard(product: exampleProduct2)
            InvestmentProductCard(product: exampleProduct3)
        }
    }
}
