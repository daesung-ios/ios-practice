//
//  ContentView.swift
//  day2-2practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI

struct VerificationNumber: View {
    @StateObject private var vm: VerificationNumberViewModel = VerificationNumberViewModel()
    
    var body: some View {
        VStack {
            CustomTextField(text: $vm.verificationNumber, placeholder: "인증번호")
            Button("다음") {
                
            }
            .buttonStyle(buttonStatus: vm.isSixDigit ? .active : .inactive)
            .disabled(!vm.isSixDigit)
        }
    }
}

class VerificationNumberViewModel: ObservableObject {
    @Published var verificationNumber: String = "123"
    var placeholder: String = "인증번호"
    var isSixDigit: Bool {
        verificationNumber.count == 6
    }
}

struct VerificationNumber_Previews: PreviewProvider {
    static var previews: some View {
        VerificationNumber()
    }
}
