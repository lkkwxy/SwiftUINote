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
    @EnvironmentObject var model: CalculatorModel
    @State var editingHistory = false
    @State var showingResult = false

    var body: some View {
        VStack{
            Spacer()
//            VStack {
//                if model.totalCount == 0 {
//                    Text("没有记录")
//                } else {
//                    HStack {
//                        Text("记录：")
//                        Text("\(model.hostioryDetail)")
//                    }
//                    HStack {
//                        Text("显示：")
//                        Text("\(model.brain.output())")
//                    }
//                    Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
//                }
//            }.padding()

            Button("操作记录\(model.history.count)") {
                self.editingHistory = true
            }.sheet(isPresented: self.$editingHistory) {
                HisrotyView(model: model, isEditing: self.$editingHistory)
            }

            Text(model.brain.output())
                .font(.system(size: 76))
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(20)
                .onTapGesture {
                    self.showingResult = true
                }.alert(isPresented: self.$showingResult) { () -> Alert in
                    let title = Text(model.hostioryDetail)
                    let message = Text(model.brain.output())
                    let dismissButton = Alert.Button.default(Text("取消")) {
                        
                    }
                    let primaryButton = Alert.Button.default(Text("复制")) {
                        UIPasteboard.general.string = model.hostioryDetail + "\n" + model.brain.output()
                    }
                    return  Alert(title: title, message: message,primaryButton: primaryButton, secondaryButton: dismissButton)
                }
            
            
            VStack(spacing: 8) {
                ForEach(cols, id: \.self) { CalculatorButtonRow(row: $0) }
            }.padding(.bottom)
        }
//        VStack{
//            HStack {
//                Spacer()
//                Text(model.brain.output())
//                    .font(.system(size: 76))
//                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
//                    .lineLimit(1)
//                    .minimumScaleFactor(0.5)
//                    .padding(20)
//            }.frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
//            VStack(spacing: 8) {
//                ForEach(cols, id: \.self) { CalculatorButtonRow(row: $0) }
//            }.padding(.bottom)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalculatorButtonRow: View {
    let row: [CalculatorButtonItem]
    @EnvironmentObject var model: CalculatorModel
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { (item) -> CalculatorButton in
                return CalculatorButton(title: item.title, size: item.size, background: item.color) {
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let size: CGSize
    let background: Color
    let action: () -> Void
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
            Button(title, action: action)
                .background(Color.clear)
                .font(.system(size: 38))
                .foregroundColor(.white)
        }
    }
}

