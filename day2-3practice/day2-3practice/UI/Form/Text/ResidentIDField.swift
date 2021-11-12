//
//  ResidentIDField.swift
//  day2-3practice
//
//  Created by temp on 2021/11/11.
//

import SwiftUI
import Combine

struct ResidentIDField: View {
    @FocusState var isLeftFocused: Bool
    @FocusState var isRightFocused: Bool
    @StateObject var vm = ViewModel()
    @Binding var text: String
    
    var placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if isLeftFocused || text != "" {
                Text(placeholder)
                    .font(.system(size: 11))
                    .foregroundColor(Color.hex("b0bec5"))
                    .padding(.bottom, 3)
            }
            HStack {
                TextField("", text: $vm.left6Digits)
                    .frame(width: isLeftFocused || text != "" || isRightFocused ? 70 : .infinity)
                    .placeholderCustomize(when: !isLeftFocused && text.isEmpty) {
                        Text(placeholder).foregroundColor(Color.hex("b0bec5"))
                    }
                    .font(.system(size: 18))
                    .focused($isLeftFocused)
                    ///Accessing FocusState's value outside of the body of a View. This will result in a constant Binding of the initial value and will not update.
                    .foregroundColor(Color.hex("263238"))
                    .accentColor(.hex("ea3392"))
                    .keyboardType(.numberPad)
                    .onReceive(vm.shouldFocusChange) { isRightFocused = true }
                if isLeftFocused || text != "" || isRightFocused {
                    HStack {
                        Text("  -  ")
                        SecureField("", text: $vm.right7Digits)
                            .focused($isRightFocused)
                    }
                    .onChange(of: vm.rightFocusing) { newValue in isRightFocused = newValue }
                }
            }
        }
        .padding(.vertical, 10)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .frame(height: 64)
        .padding(.horizontal, 20)
        .cardStyle(cardStatus: isLeftFocused || isRightFocused ? .focused : .normal)
    }
}

extension ResidentIDField {
    class ViewModel: ObservableObject {
        @Published var left6Digits: String = ""
        @Published var right7Digits: String = ""
        @Published var leftFocusing: Bool = false
        @Published var rightFocusing: Bool = false
        
        var shouldFocusChange = PassthroughSubject<Void, Never>()
        
        var cancellables = Set<AnyCancellable>()
        
        init() {
            $left6Digits
                .removeDuplicates()
                .filter { $0.count == 6 }
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [weak self] _ in
                    self?.shouldFocusChange.send()
                })
                .store(in: &cancellables)
        }
        
        ///var projectedValue: FocusState<Value>.Binding { get }

        var leftFilled: AnyPublisher<(String, String), Never> {
            $left6Digits
                .removeDuplicates()
                .scan(("", "")) { ($0.1, $1) }
                .share()
                //퍼블리셔에서 한번 보내서 두명이상이 받으면 될텐데 2번 퍼블리싱하면 안좋으니까 쓴다.
                .eraseToAnyPublisher()
        }

        var cancellables = Set<AnyCancellable>()

        init() {
            if left6Digits.isEmpty {
                leftFilled
                    .filter { $0.0.count == 5 && $0.1.count > 5 }
                    .receive(on: RunLoop.main)
                    .sink { _ in
                        self.leftFocusing = false
                        self.rightFocusing = true
                    }
                    .store(in: &cancellables)
            }
        }
    }
}

fileprivate struct ResidentIDFieldTestView: View {
    @State private var residentID: String = ""
    @State private var forTest: String = "2"
    
    var body: some View {
        VStack {
            ResidentIDField(text: $residentID, placeholder: "주민등록번호")
            ResidentIDField(text: $forTest, placeholder: "testField")
        }
    }
    
    /// @FocusState preview seems to work only if there are at least 2 views that are focusable
}

struct ResidentIDField_Previews: PreviewProvider {
    static var previews: some View {
        ResidentIDFieldTestView()
    }
}
