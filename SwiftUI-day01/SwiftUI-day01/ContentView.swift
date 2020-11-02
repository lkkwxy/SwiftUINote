//
//  ContentView.swift
//  SwiftUI-day01
//
//  Created by 李坤 on 2020/11/2.
//

import SwiftUI

struct ContentView: View {
    let cols = [
        [CalculatorButtonItem.command(.clear),
         CalculatorButtonItem.command(.flip),
         CalculatorButtonItem.command(.percent),
         CalculatorButtonItem.op(.divide)
        ],
        [CalculatorButtonItem.digit(7),
         CalculatorButtonItem.digit(8),
         CalculatorButtonItem.digit(9),
         CalculatorButtonItem.op(.multiply)
        ],
        [CalculatorButtonItem.digit(4),
         CalculatorButtonItem.digit(5),
         CalculatorButtonItem.digit(6),
         CalculatorButtonItem.op(.minus)
        ],
        [CalculatorButtonItem.digit(1),
         CalculatorButtonItem.digit(2),
         CalculatorButtonItem.digit(3),
         CalculatorButtonItem.op(.plus)
        ],
        [CalculatorButtonItem.digit(0),
         CalculatorButtonItem.dot,
         CalculatorButtonItem.op(.equal)
        ]
    ]
    var body: some View {
//        VStack{
//            Spacer()
//            Text("0")
//                .font(.system(size: 76))
//                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
//                .lineLimit(1)
//                .minimumScaleFactor(0.5)
//                .padding(20)
//            VStack(spacing: 8) {
//                ForEach(cols, id: \.self) { CalculatorButtonRow(row: $0) }
//            }.padding(.bottom)
//        }
        VStack{
            HStack {
                Spacer()
                Text("0")
                    .font(.system(size: 76))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(20)
            }.frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
            VStack(spacing: 8) {
                ForEach(cols, id: \.self) { CalculatorButtonRow(row: $0) }
            }.padding(.bottom)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { (item) -> CalculatorButton in
                return CalculatorButton(title: item.title, size: item.size, background: item.color)
            }
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let size: CGSize
    let background: Color
    
    var body: some View {
//        Button(action: {
//            print(Int.random(in: 0...100))
//        }, label: {
//            Text(title)
//                .font(.system(size: 38))
//                .frame(width: size.width, height: size.height)
//                .foregroundColor(.white)
//                .background(background)
//                .cornerRadius(size.height / 2)
//        })
        ZStack {
            RoundedRectangle(cornerRadius: size.height / 2)
                .frame(width: size.width, height: size.height, alignment: .center)
                .background(Color.clear)
                .foregroundColor(background)
            Button(title) {

            }.background(Color.clear)
            .font(.system(size: 38))
            .foregroundColor(.white)
        }
    }
}

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
            return CGSize(width: 180, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
}
