//
//  Adapter.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

/// 状态栏高度
let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度: 状态栏高度 + 44
let NavigationHeight: CGFloat = StatusBarHeight + 44

/// 屏幕宽度
let Width = UIScreen.main.bounds.size.width
/// 屏幕高度
let Height = UIScreen.main.bounds.size.height
/// 屏幕比例
let Scale = UIScreen.main.scale
/// 屏幕比例
let Ratio: CGFloat = 750 / min(Width, Height)

/// 扩展Int 用于尺寸按比例适配
extension Int {

    var px: CGFloat {
        return CGFloat(Int(CGFloat(self) / Ratio))
    }
}
