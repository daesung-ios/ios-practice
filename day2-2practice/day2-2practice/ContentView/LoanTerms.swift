//
//  LoanTerms.swift
//  day2-2practice
//
//  Created by temp on 2021/11/09.
//

import SwiftUI

struct LoanTerms: View {
    @StateObject private var vm: LoanTermsViewModel = LoanTermsViewModel()
    
    var tooltipGeometry: CGFloat = 0
    
    var body: some View {
        VStack {
            CustomTextField(text: $vm.loanAmount, placeholder: "신청금액(5천만원)")
            HStack(alignment: .top) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("이자율")
                            .font(.system(size: 12))
                            .foregroundColor(Color.hex("78909d"))
                        VStack {
                            Tooltip()
                        }
                    }
                    .zIndex(1)
                    Text(vm.text)
                        .font(.system(size: 24, weight: .bold))
                    Text("(플랫폼 이용료 포함)")
                        .font(.system(size: 10))
                        .foregroundColor(Color.hex("b0bec5"))
                }
                .padding(.horizontal, 27)
                VStack {
                    Text("최대한도")
                        .font(.system(size: 12))
                        .foregroundColor(Color.hex("78909d"))
                    Text(vm.limitInString)
                        .font(.system(size: 24, weight: .bold))
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .padding(.vertical, 15)
            .cardStyle(cardStatus: .noBorderLight)
        }
    }
}

class LoanTermsViewModel: ObservableObject {
    @Published var interestRate: Double = 6.5
    @Published var limit: Int = 5000
    @Published var loanAmount: String = "300"
    @Published var toolTipIsOpen: Bool = false
    var text: String { "연\(interestRate)%" }
    var limitInString: String { "\(limit)" }
}

struct LoanTerms_Previews: PreviewProvider {
    static var previews: some View {
        LoanTerms()
    }
}
