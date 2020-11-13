//
//  BlurView.swift
//  PokeMaster
//
//  Created by 李坤 on 2020/11/11.
//

import Foundation
import SwiftUI
import UIKit
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
 
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let blurView = uiView.subviews.first as? UIVisualEffectView {
            blurView.effect = UIBlurEffect(style: style)
        }
    }

}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }

    }
}
