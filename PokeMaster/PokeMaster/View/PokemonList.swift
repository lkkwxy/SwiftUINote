//
//  PokemonList.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/6.
//

import Foundation
import SwiftUI
struct PokemonList: View {
    @State var expandingIndex: Int?
    var body: some View {
//        List(PokemonViewModel.all) { pokenViewModel in
//            PokemonInfoCell(model: pokenViewModel, expanded: false)
//        }
        ScrollView {
            LazyVStack {
                ForEach(PokemonViewModel.all) { pokemon in
                    PokemonInfoCell(model: pokemon, expanded: self.expandingIndex == pokemon.id).padding([.leading,.trailing])
                        .onTapGesture {
                            withAnimation(.spring(response: 0.55, dampingFraction: 0.425, blendDuration: 0)) {
                                if self.expandingIndex == pokemon.id {
                                    self.expandingIndex = nil
                                } else {
                                    self.expandingIndex = pokemon.id
                                }
                            }
                        }
                }
            }
        }
    }
}
