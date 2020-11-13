//
//  PokemonRootView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/13.
//

import Foundation
import SwiftUI
struct PokemonRootView: View {
    var body: some View {
        NavigationView {
            PokemonList()
                .overlay(
                    VStack {
                        Spacer()
                        PokemonInfoPanel()
                    }.edgesIgnoringSafeArea(.bottom)
                ).navigationTitle("宝可梦列表")
        }
    }
}
