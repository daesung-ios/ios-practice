//
//  SelectCard.swift
//  day5practice
//
//  Created by temp on 2021/11/05.
//

import SwiftUI

struct SelectCard: View {
    @Binding var selectedData: String?
    var jobOptions: [String] = ["직장인", "공무원", "개인사업자", "기타"]
    
    var body: some View {
        CategoriesContainer
    }
    
    var Categories: some View {
        ZStack {
            VStack {
                ForEach(jobOptions, id: \.self) { option in
                    Button(action: {
                        selectedData = option
                    }) {
                        HStack {
                            Text(option)
                            Spacer()
                            Image(selectedData == option ? "oval-checkbox-on" : "oval-checkbox-off")
                        }
                        .cardTypeButton(cardStatus: selectedData == option ? .selected : .notSelected)
                        
                    }
                }
            }
            
            VStack {
                PickerField(headLine: selectedData, title: selectedData)
            }
        }
    }
    
    var CategoriesContainer: some View {
        Section("직군분류") {
            Categories
        }
    }
}

struct SelectCard_Previews: PreviewProvider {
    static var previews: some View {
        SelectCard(selectedData: .constant("직장인"))
    }
}
