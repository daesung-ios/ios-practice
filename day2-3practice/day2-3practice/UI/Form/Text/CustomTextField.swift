//
//  CustomTextField.swift
//  day2-3practice
//
//  Created by temp on 2021/11/10.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @State var isRevealed: Bool = false
    @FocusState private var isFocused: Bool
    var placeholder: String
    var iconName: String? = nil
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                if text != "" {
                    Text(placeholder)
                        .font(.system(size: 11))
                        .foregroundColor(Color.hex("b0bec5"))
                        .padding(.bottom, 3)
                }
                TextField(
                    "",
                    text: $text
                )
                    .placeholderCustomize(when: text.isEmpty) {
                        Text(placeholder).foregroundColor(Color.hex("b0bec5"))
                    }
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
                    .foregroundColor(Color.hex("263238"))
                    .focused($isFocused)
                    .accentColor(.hex("ea3392"))
                    .keyboardType(keyboardType)
            }
            .padding(.vertical, 10)
            Spacer()
            if let _iconName = iconName {
                Image(_iconName)
                    .frame(width: 24, height: 24)
            }
        }
        .frame(height: 64)
        .padding(.horizontal, 20)
        .cardStyle(cardStatus: isFocused ? .focused : .normal)
    }
}

extension View {
    func placeholderCustomize<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension CustomTextField {
    class ViewModel: ObservableObject {
        
    }
}

fileprivate struct CustomTextFieldTestView: View {
    @State private var text1: String = "with title"
    @State private var text2: String = ""
    @State private var text3: String = ""
    @State private var text4: String = ""
    
    var body: some View {
        VStack {
            CustomTextField(text: $text1, placeholder: "placeholder")
            CustomTextField(text: $text2, placeholder: "placeholder")
            CustomTextField(text: $text3, placeholder: "placeholder", iconName: "ic-arrow-down")
            HStack {
                CustomTextField(text: $text4, placeholder: "password")
                SecureField("sd", text: .constant("sdf"))
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldTestView()
    }
}
