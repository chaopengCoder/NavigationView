//
//  AppDelegate.swift
//  NavigationView
//
//  Created by cpcoder on 04/26/2022.
//  Copyright (c) 2022 cpcoder. All rights reserved.
//

import UIKit
@_exported import NavigationView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        // 使用NavigationController初始化
        window?.rootViewController = UINavigationController(rootViewController: AViewController())
        window?.makeKeyAndVisible()

        // 全局导航配置, 都有默认值
        NavigationManager.shared.configNavigation { config in
            /// 后退按钮图片名称，默认："nav_btn_close_pre"
            config.backImageName = "nav_btn_close_pre"
            /// 左键到屏幕的距离，默认：8 pt
            config.leftSpacing = 8
            /// 右视图到屏幕的距离，默认：8 pt
            config.rightSpacing = 8
            /// 标题颜色，默认：UIColor.black
            config.titleColor = UIColor.black
            /// 背景色，默认：UIColor.clear
            config.backgaroundColor = UIColor.clear
            /// 右侧每一项的高度，默认：30 pt
            config.rightViewItemsHeight = 30
            /// 右侧有多个项目时项目之间的间距，默认：10 pt
            config.rightViewItemsSpacing = 10
            /// 标题字体，默认：UIFont.systemFont(ofSize: 15, weight: .medium)
            config.titleFont = UIFont.systemFont(ofSize: 15, weight: .medium)
            config.backgroundImageName = "search_view_bg"
        }
        
        return true
    }

}



