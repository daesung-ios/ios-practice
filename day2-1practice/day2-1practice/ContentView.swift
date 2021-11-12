//
//  ContentView.swift
//  day2-1practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Section(title: "신규 투자 상품") {
                        ForEach(investmentProducts, id: \.self) { product in
                            if product.currentStatus == .new {
                                NavigationLink(destination: EmptyView()) {
                                    InvestmentProductCard(product: product)
                                }
                            }
                        }
                    }
                    Section(title: "오픈 예정 상품") {
                        ForEach(investmentProducts, id: \.self) { product in
                            if product.currentStatus == .willOpenSoon {
                                NavigationLink(destination: EmptyView()) {
                                    InvestmentProductCard(product: product)
                                }
                            }
                        }
                    }
                    Section(title: "마감된 상품") {
                        ForEach(investmentProducts, id: \.self) { product in
                            if product.currentStatus == .closed {
                                NavigationLink(destination: EmptyView()) {
                                    InvestmentProductCard(product: product)
                                }
                            }
                        }
                    }
                }
            }
            .background(Color.hex("f6f7f9"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
