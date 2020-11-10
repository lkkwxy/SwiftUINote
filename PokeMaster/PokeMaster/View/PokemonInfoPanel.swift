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
    let abilitys : [AbilityViewModel]
    
    init() {
        abilitys = AbilityViewModel.sample(pokemonID: pokemonMode.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    var body: some View {
        VStack {
//            Spacer()
            topIndicator
            Header(pokemonMode: pokemonMode)
        }
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
}








struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel()
    }
}
