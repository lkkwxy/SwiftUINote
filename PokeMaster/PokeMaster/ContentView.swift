//
//  ContentView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/6.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PokemonRootView().tabItem { Text("首页") }.tag(1)
            SettingRootView().tabItem { Text("设置") }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
