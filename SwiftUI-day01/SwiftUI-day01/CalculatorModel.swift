//
//  CalculatorModel.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation



class CalculatorModel: ObservableObject {
    @Published var brain: CalculateBrain = CalculateBrain.left("0")
    
    func apply(_ item: CalculatorButtonItem)  {
        brain = brain.apply(item: item)
    }
}
