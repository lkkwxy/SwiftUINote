//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by 李坤坤 on 2020/11/9.
//

import Foundation
import SwiftUI
struct PokemonInfoPanel: View {
    let pokemonMode: PokemonViewModel = PokemonViewModel.sample(id: 34)
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
            topIndicator
            Header(pokemonMode: pokemonMode)
        }
    }
    
}

extension PokemonInfoPanel {
    
    struct Header: View {
        let pokemonMode: PokemonViewModel
        var body: some View {
            HStack {
                Image("Pokemon-\(pokemonMode.id)")
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
