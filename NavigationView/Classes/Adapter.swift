//
//  Adapter.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

/// StatusBar height
var StatusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.size.height
}

/// NavigationBar height
let NavigationBarHeight: CGFloat = 44

/// NavigationView height = Status Bar's height + NavigationBar's height
let NavigationHeight: CGFloat = StatusBarHeight + NavigationBarHeight

