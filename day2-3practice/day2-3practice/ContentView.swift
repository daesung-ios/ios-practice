//
//  ContentView.swift
//  day2-3practice
//
//  Created by temp on 2021/11/10.
//

import SwiftUI

struct ContentView: View {
    @State var testText = "qwer"
    @State var testText2 = "qwer"
    var body: some View {
        VStack {
            ResidentIDField(text: $testText, placeholder: "")
            ResidentIDField(text: $testText2, placeholder: "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
