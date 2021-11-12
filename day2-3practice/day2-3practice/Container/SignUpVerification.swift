//
//  SignUpVerification.swift
//  day2-3practice
//
//  Created by temp on 2021/11/11.
//

import SwiftUI

struct SignUpVerification: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack {
            CustomTextField(text: $vm.name, placeholder: "이름")
        }
    }
}

extension SignUpVerification {
    class ViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var ssn: String = ""
        @Published var cellPhoneNumber: String = ""
    }
}

struct SignUpVerification_Previews: PreviewProvider {
    static var previews: some View {
        SignUpVerification(vm: SignUpVerification.ViewModel.init())
    }
}
