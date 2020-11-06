//
//  PokemonInfoCell.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/6.
//

import Foundation
import SwiftUI
struct PokemonInfoCell: View {
    let model:PokemonViewModel
    var expanded = false
    var body: some View {
        VStack {
            HStack {
                Image("Pokemon-1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: ContentMode.fit)
                    .shadow(radius: 4)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(.top, 12)
            Spacer()
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button {
                    print("111")
                } label: { () in
                    Image(systemName: "star")
                        .font(Font.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                Button {
                    print("222")
                } label: { () in
                    Image(systemName: "chart.bar")
                        .font(Font.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
                Button {
                    print("222")
                } label: { () in
                    Image(systemName: "info.circle")
                        .font(Font.system(size: 25))
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                }
            }.padding(.bottom, 12)
            .opacity(expanded ? 1 : 0)
            .frame(maxHeight: expanded ? .infinity : 0)
        }.frame(height: expanded ? 120 : 80)
        .padding(.leading, 15)
        .padding(.trailing, 15)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(model.color, style: StrokeStyle(lineWidth: 4))
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient:Gradient(colors:  [.white, model.color]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
            }
        )
//        .onTapGesture(perform: {

//            
//        })
    }
}

struct PokemonInfoCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoCell(model: PokemonViewModel.sample(id: 4)).padding(3)
    }
}
