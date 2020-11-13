//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by 李坤坤 on 2020/11/9.
//

import Foundation
import SwiftUI
struct PokemonInfoPanel: View {
    let pokemonMode: PokemonViewModel = PokemonViewModel.sample(id: 1)
    @State var isDark = false
    var abilitys : [AbilityViewModel] {
        return AbilityViewModel.sample(pokemonID: pokemonMode.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    var pokemonDescripition: some View {
        Text("\(pokemonMode.descriptionText)")
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Button("切换模式") {
                self.isDark.toggle()
            }
            topIndicator
            Header(pokemonMode: pokemonMode)
            pokemonDescripition
            Divider()
            AbilityList(pokemonMode: pokemonMode, abilitys: abilitys)
        }
        .padding(
            EdgeInsets(
                top: 12,
                leading: 30,
                bottom: 30,
                trailing: 30
            )
        )
        .blurBackground(style: isDark ? .systemMaterialDark : .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
    }
    
}

extension PokemonInfoPanel {
    struct Header: View {
        let pokemonMode: PokemonViewModel
        var spliteLine: some View {
            RoundedRectangle(cornerRadius: 0)
                .frame(width: 1, height: 44)
                .opacity(0.1)
        }
        var body: some View {
            HStack(spacing: 18) {
                Image("Pokemon-\(pokemonMode.id)")
                    .resizable()
                    .frame(width: 68, height: 68)
                VStack {
                    Text("\(pokemonMode.name)")
                        .foregroundColor(pokemonMode.color)
                        .font(.system(size: 22, weight: .bold))
                    Text("\(pokemonMode.nameEN)")
                        .foregroundColor(pokemonMode.color)
                        .font(.system(size: 13, weight: .bold))
                    Text("\(pokemonMode.genus)")
                        .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3, opacity: 1))
                        .font(.system(size: 13, weight: .bold))
                        .padding(.top, 10)
                }
                spliteLine
                VStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text("身高")
                                .font(.system(size : 11))
                                .foregroundColor(.gray)
                            Text("\(pokemonMode.height)")
                                .font(.system(size : 11))
                                .foregroundColor(pokemonMode.color)
                        }
                        HStack {
                            Text("体重")
                                .font(.system(size : 11))
                                .foregroundColor(.gray)
                            Text("\(pokemonMode.weight)")
                                .font(.system(size : 11))
                                .foregroundColor(pokemonMode.color)
                        }
                    }
                    
                    HStack {
                        ForEach(pokemonMode.types) { (type) in
                            Text("\(type.name)")
                                .font(.system(size : 10))
                                .foregroundColor(.white)
                                .frame(width: 36, height: 14)
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(type.color)
                                )
                        }
                        
                    }
                    
                }
                
            }
        }
        
        init(pokemonMode: PokemonViewModel) {
            self.pokemonMode = pokemonMode
        }
    }
    
    struct AbilityList: View {
        let pokemonMode: PokemonViewModel
        let abilitys : [AbilityViewModel]
        var body: some View {
            VStack (alignment: .leading, spacing: 12) {
                Text("技能")
                    .font(.headline)
                    .bold()
                ForEach(abilitys) { ability in
                    Text(ability.name)
                        .font(.headline)
                        .foregroundColor(pokemonMode.color)
                    Text(ability.descriptionText)
                        .font(.footnote)
                        .foregroundColor(Color(hex: 0xAAAAAA))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel()
    }
}
