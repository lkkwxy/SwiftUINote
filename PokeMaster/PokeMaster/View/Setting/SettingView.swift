//
//  SettingView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/12.
//

import Foundation
import SwiftUI

struct SettingView: View {
    @ObservedObject var settings = Settings()
    var optionSection: some View {
        Section(header: Text("选项")) {
            Toggle(isOn: $settings.showEnglishName) {
                Text("显示英文名")
            }
            Picker(selection: $settings.sorting, label: Text("排序方式")) {
                ForEach(Settings.Sorting.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            Toggle(isOn: $settings.showFavoriteOnly) {
                Text("只显示收藏")
            }
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账号")) {
            Picker(selection: $settings.accountBehavior, label: Text(""), content: {
                ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                    Text($0.text)
                }
            }).pickerStyle(SegmentedPickerStyle())
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            Button(settings.accountBehavior.text) {
                print("登录/注册")
            }
        }
    }
    
    var clearCacheAction: some View {
        Section(header: Text("")) {
            Button("清除缓存") {
                print("登录/注册")
            }.foregroundColor(Color.red)
        }
    }
    
    var body: some View {
        Form {
            accountSection
            optionSection
            clearCacheAction
        }
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
