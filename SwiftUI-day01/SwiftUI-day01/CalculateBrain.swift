//
//  CalculateBrain.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/2.
//

import Foundation
enum CalculateBrain {
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left: String, op: CalculatorButtonItem.Op, right: String)
    case error
    
    @discardableResult
    func apply(item: CalculatorButtonItem) -> CalculateBrain {
        switch item {
        case .digit(let num): return apple(num: num)
        case .dot: return appleDot()
        case .op(let op): return apply(op: op)
        case .command(let cmd): return apply(cmd: cmd)
        }
    }
    
    func output() -> String {
        let result: String
        switch self {
        case .left(let left): result = left
        case .leftOp(let left, _): result = left
        case .leftOpRight(_, _, let right): result = right
        case .error: return "error"
        }
        guard let value = Double(result) else {
            return "Error"
        }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        formatter.numberStyle = .decimal
        return formatter.string(for: value)!
    }
    
    private func apple(num: Int) -> CalculateBrain {
        switch self {
        case .left(let left): return .left(left.apply(num: num))
        case .leftOp(let left, let op): return .leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right): return .leftOpRight(left: left, op: op, right: right.apply(num: num))
        case .error: return .left("\(num)")
        }
    }
    
    private func appleDot() -> CalculateBrain {
        switch self {
        case .left(let left): return .left(left.applyDot())
        case .leftOp(let left,let op): return .leftOpRight(left: left, op: op, right: "0".applyDot())
        case .leftOpRight(let left, let op, let right): return .leftOpRight(left: left, op: op, right: right.applyDot())
        case .error: return .left("0")
        }
    }
    
    private func apply(op: CalculatorButtonItem.Op) -> CalculateBrain {
        switch self {
        case .left(let left):
            switch op {
            case .minus, .multiply, .divide, .plus: return .leftOp(left: left, op: op)
            case .equal: return self
            }
        case .leftOp(let left, let curOp):
            switch op {
            case .minus, .multiply, .divide, .plus: return .leftOp(left: left, op: op)
            case .equal:
                if let result = curOp.calculator(l: left, r: left) {
                    return .left(result)
                } else {
                    return .error
                }
            }
        case .leftOpRight(let left, let curOp, let right):
            if let result = curOp.calculator(l: left, r: right) {
                return .leftOp(left: result, op: op)
            } else {
                return .error
            }
        case .error:
            return self
        }
    }
    
    private func apply(cmd: CalculatorButtonItem.Command) -> CalculateBrain {
        switch cmd {
        case .clear: return .left("0")
        case .flip:
            switch self {
            case .left(let left): return .left(left.flipped())
            case .leftOp: return self
            case .error: return .left("-0")
            case .leftOpRight(let left, let op, let right): return .leftOpRight(left: left, op: op, right: right.flipped())
            }
        case .percent:
            switch self {
            case .left(let left): return .left(left.percentaged())
            case .leftOp: return self
            case .error: return .left("-0")
            case .leftOpRight(let left, let op, let right): return .leftOpRight(left: left, op: op, right: right.percentaged())
            }
        }
    }
}

extension String {
    var isContainsDot: Bool {
        return contains(".")
    }
    
    var isStartsNegative: Bool {
        return starts(with: "-")
    }
    
    fileprivate func apply(num: Int) -> String {
        return self == "0" ? "\(num)" : "\(self)\(num)"
    }
    
    fileprivate func applyDot() -> String {
        return isContainsDot ? self : self + "."
    }
    
    fileprivate func percentaged() -> String {
        return String(Double(self)! / 100)
    }
    
    fileprivate func flipped() -> String {
        if isStartsNegative {
            var tmp = self
            tmp.removeFirst()
            return tmp
        } else {
            return "-\(self)"
        }
    }
}

extension CalculatorButtonItem.Op {
    func  calculator(l: String, r: String) -> String? {
        guard let left = Double(l), let right = Double(r) else {
            return nil
        }
        switch self {
        case .divide: return right == 0 ? nil : "\(left / right)"
        case .multiply: return "\(left * right)"
        case .minus: return "\(left - right)"
        case .plus: return "\(left + right)"
        case .equal: fatalError()
        }
    }
}
