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
    @State var searchText = ""
    var body: some View {
        ScrollView {
            LazyVStack {
                TextField("搜索", text: $searchText)
                    .frame(height: 40)
                    .padding(.horizontal, 25)
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
