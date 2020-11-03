//
//  CalculatorModel.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation



class CalculatorModel: ObservableObject {
    @Published var brain: CalculateBrain = CalculateBrain.left("0")
    @Published var history: [CalculatorButtonItem] = []
    private var temporaryKept: [CalculatorButtonItem] = []
    func apply(_ item: CalculatorButtonItem)  {
        brain = brain.apply(item: item)
        history.append(item)
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
    }
    
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "out of range")
        let total = history + temporaryKept
        history = Array(total[0..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculateBrain.left("0"), { $0.apply(item: $1) })
    }
    
    var hostioryDetail: String {
        return history.map { $0.description }.joined()
    }
    
    var totalCount: Int {
        return history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
}
