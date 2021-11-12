//
//  VerificationNumberView.swift
//  day2-2practice
//
//  Created by temp on 2021/11/08.
//

import SwiftUI


struct CustomTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var placeholder: String
    
    var body: some View {
        HStack(alignment: .center
        ) {
            VStack(alignment: .leading, spacing: 0) {
                Text(placeholder)
                    .font(.system(size: 11))
                    .foregroundColor(Color.hex("b0bec5"))
                    .padding(.bottom, 3)
                TextField(
                    placeholder,
                    text: $text
                )
                    .font(.system(size: 18))
                    .foregroundColor(Color.hex("263238"))
                    .focused($isFocused)
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 20)
        .cardStyle(cardStatus: isFocused ? .focused : .normal)
    }
}

struct VerificationNumberCard_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("50"), placeholder: "인증번호")
    }
}
