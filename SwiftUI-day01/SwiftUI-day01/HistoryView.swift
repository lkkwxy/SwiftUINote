//
//  HistoryView.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/3.
//

import Foundation
import SwiftUI
struct HisrotyView: View {
    @ObservedObject var model: CalculatorModel
    @Binding var isEditing: Bool
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有记录")
            } else {
                HStack {
                    Text("记录：")
                    Text("\(model.hostioryDetail)")
                }
                HStack {
                    Text("显示：")
                    Text("\(model.brain.output())")
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
            Button("关闭") {
                self.isEditing = false
            }
        }.padding()
    }
}

