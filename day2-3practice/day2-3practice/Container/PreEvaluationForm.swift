//
//  PreEvaluationForm.swift
//  day2-3practice
//
//  Created by temp on 2021/11/10.
//

import SwiftUI

struct PreEvaluationForm: View {
    @StateObject var vm: PreEvaluationFormViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0) {
                SelectTab(selectedData: $vm.selectedData, data: ["정규직", "계약직", "파견직", "기타"])
                    .padding(.bottom, 20)
                Button(action: { vm.isPresented.toggle() }) {
                    if vm.companyName == "" {
                    Text("직장명")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .cardStyle(cardStatus: .normal)
                    } else {
                        CustomTextField(text: $vm.companyName, placeholder: "직장명")
                            .disabled(true)
                    }
                }
                .sheet(isPresented: $vm.isPresented, content: { sheet })
                .padding(.bottom, 10)
                Text("현직장 입사시기")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .cardStyle(cardStatus: .normal)
                    .padding(.bottom, 10)
//                    .onTapGesture {
//                        DatePicker(selection: vm.date, label: "selection")
//                    }
                Text("연소득(만원)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .cardStyle(cardStatus: .normal)
                    .padding(.bottom, 10)
                
                Button(action: { vm.isDateSheetPresent = !vm.isDateSheetPresent }) {
                    if vm.dateText == "" {
                        Text("현직장 입사시기")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                            .cardStyle(cardStatus: .normal)
                    } else {
                        CustomTextField(text: $vm.companyName, placeholder: "현직장 입사시기")
                            .disabled(true)
                    }
                }
                .sheet(isPresented: $vm.isDateSheetPresent) { datePicker }
            }
        }
        .padding(15)
    }
    
    var sheet: some View {
        NavigationView {
            VStack {
                if !vm.isManualInput {
                    CustomTextField(text: $vm.companyName, placeholder: "직장명 검색")
                        .padding(.bottom, 50)
                    Text("직장명을 한글로 검색해주세요.")
                        .font(.system(size: 14))
                        .foregroundColor(Color.hex("78909d"))
                    Spacer()
                    HStack {
                        Text("직장명이 없나요?")
                            .font(.system(size: 14))
                        .foregroundColor(Color.hex("78909d"))
                        Text("직접 입력하기")
                            .font(.system(size: 14, weight: .bold))
                            .underline()
                            .onTapGesture { vm.isManualInput = !vm.isManualInput}
                    }
                    .padding(.bottom, 20)
                } else {
                    VStack {
                        Text("직장명 직접 입력하기")
                            .font(.system(size: 22))
                            .foregroundColor(Color.hex("263238"))
                            .padding(.bottom, 40)
                        CustomTextField(text: $vm.companyName, placeholder: "직장명")
                            .padding(.bottom, 50)
                        Spacer()
                        Button(action: {
                            vm.isPresented = !vm.isPresented
                        }) {
                            Text("확인")
                                .frame(minWidth: 0, maxWidth: .infinity)
                        }
                        .buttonStyle(buttonStatus: vm.companyName == "" ? .inactive : .active)
                        .disabled(vm.companyName == "")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("ic-close")
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            vm.isPresented = !vm.isPresented
                        }
                }
                    }
            .padding(15)
        }
    }
    
    var datePicker: some View {
        DatePicker (
            "",
            selection: $vm.date,
            displayedComponents: [.date]
        )
    }
}

class PreEvaluationFormViewModel: ObservableObject {
    @Published var selectedData: String? = nil
    @Published var text: String = ""
    @Published var isPresented: Bool = false
    @Published var companyName: String = ""
    @Published var isManualInput: Bool = false
    @Published var date: Date = Date()
    @Published var dateText: String = ""
    @Published var isDateSheetPresent: Bool = false
}

struct PreEvaluationForm_Previews: PreviewProvider {
    static var previews: some View {
        PreEvaluationForm(vm: PreEvaluationFormViewModel())
    }
}
