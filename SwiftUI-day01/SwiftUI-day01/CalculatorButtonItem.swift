//
//  CalculatorButtonItem.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
    }
    enum Command: String {
        case clear = "C"
        case flip = "+/-"
        case percent = "%"
    }
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem: Hashable { }

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value): return "\(value)"
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let command): return command.rawValue
        }
    }
    
    var color: Color {
        switch self {
        case .digit, .dot: return Color("digitBackground")
        case .op: return Color("operatorBackground")
        case .command: return Color("commandBackground")
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
}

extension CalculatorButtonItem: CustomStringConvertible {
    var description: String {
        switch self {
        case .dot: return "."
        case .op(let op): return op.rawValue
        case .command(let cmd): return cmd.rawValue
        case .digit(let num): return "\(num)"
        }
    }
    
    
}
