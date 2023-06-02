//
//  Adapter.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

/// StatusBar height
var StatusBarHeight: CGFloat {
    if #available(iOS 13.0, *) {
        let h = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 40
        return h
    } else {
        return UIApplication.shared.statusBarFrame.size.height
    }
}

/// NavigationBar height
let NavigationBarHeight: CGFloat = 44

/// NavigationView height = Status Bar's height + NavigationBar's height
let NavigationHeight: CGFloat = StatusBarHeight + NavigationBarHeight

