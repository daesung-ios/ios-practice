//
//  PickerField.swift
//  day5practice
//
//  Created by temp on 2021/11/05.
//

import SwiftUI

struct PickerField: View {
    var headLine: String? = "head_example"
    var title: String = "example"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("sdgsdgdsg")
//                Text(headLine)
//                    .font(.system(size: 11))
//                    .foregroundColor(Color.hex("b0bec5"))
//                Text(title)
//                    .font(.system(size: 18))
//                    .foregroundColor(Color.hex("b0bec5"))
            }
            Spacer()
            Image("ic-arrow-down")
        }
        .cardTypeButton(cardStatus: .notSelected)
    }
}

struct PickerField_Previews: PreviewProvider {
    static var previews: some View {
        PickerField(title: "Example")
    }
}
