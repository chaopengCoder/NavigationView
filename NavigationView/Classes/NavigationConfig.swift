//
//  NavigationViewConfig.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

public class NavigationConfig {
    
    public var backImgName = ""
    public var titleColor = UIColor.black
    public var titleFont = UIFont.systemFont(ofSize: 30.px, weight: .medium)
    
    func check() {
        if backImgName.isEmpty {
            fatalError("未设置导航条返回按钮icon: NavigationConfig.shared.backImgName")
        }
    }
}
