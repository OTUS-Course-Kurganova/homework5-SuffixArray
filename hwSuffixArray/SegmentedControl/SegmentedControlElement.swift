//
//  SegmentedControlElement.swift
//  hwSuffixArray
//
//  Created by Alexandra Kurganova on 12.03.2023.
//

import SwiftUI

struct SegmentedControlElement: View {
    @EnvironmentObject var viewModel: SegmentedViewModel
    @EnvironmentObject var textFieldViewModel: TextFieldElementViewModel

    @State var buttontitle: String = "ASC"

    var body: some View {
        pickerView
        ScrollView {
            if viewModel.selectedSegment == 0 {
                buttonSort
                Text(textFieldViewModel.suffixCountSorted)
                    .onAppear {
                        setAlphabeticalSort()
                    }
            }
            if viewModel.selectedSegment == 1 {
                Text(textFieldViewModel.suffixCountSorted)
                    .onAppear {
                        textFieldViewModel.setTop10Sort()
                    }
            }
        }
    }
    
    fileprivate var pickerView: some View {
        Picker("Cуффиксы: ", selection: $viewModel.selectedSegment) {
            Text("Все суффиксы")
                .tag(0)
            Text("Топ")
                .tag(1)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.teal)
    }
    
    fileprivate var buttonSort: some View {
        Button(buttontitle) {
            buttontitle == "ASC" ? (buttontitle = "DESC") : (buttontitle = "ASC")
            setAlphabeticalSort()
        }
        .padding(.bottom, 5)
    }
    
    private func setAlphabeticalSort() {
        if buttontitle == "ASC" {
            textFieldViewModel.setAlphabeticalSort(type: .asc)
        } else {
            textFieldViewModel.setAlphabeticalSort(type: .desc)
        }
    }
}

struct SegmentedControlElement_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlElement()
    }
}
