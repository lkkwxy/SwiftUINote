//
//  ContentView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/6.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        PokemonList()
            .overlay(
                VStack {
                    Spacer()
                    PokemonInfoPanel()
                }.edgesIgnoringSafeArea(.bottom)
            )
//
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
