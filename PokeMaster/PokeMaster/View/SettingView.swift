//
//  SettingView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/12.
//

import Foundation
import SwiftUI
struct AppState {
    var settings = Settings()
}

extension AppState {
    struct Settings {
        enum Sorting: CaseIterable {
            case id, name, color, favorite
        }

        enum AccountBehavior: CaseIterable {
            case register, login
        }

        var accountBehavior = AccountBehavior.login
        var email = ""
        var password = ""
        var verifyPassword = ""
        
        var showEnglishName = true
        var sorting = Sorting.id
        var showFavoriteOnly = false

//        @FileStorage(directory: .documentDirectory, fileName: "user.json")
//        var loginUser: User?

        var loginRequesting = false
//        var loginError: AppError?
    }
}
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
    var body: some View {
        Form {
            AccountSection()
            optionSection
        }
    }
}

extension SettingView {
    struct AccountSection: View {
        @ObservedObject var settings = Settings()
        var body: some View {
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
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
