//
//  NavigationManager.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

public class NavigationManager {
    public static let shared = NavigationManager()
    
    // 配置模型
    let config = NavigationConfig()
    
    public func configNavigation(callback: (NavigationConfig) -> ()) {
        callback(config)
    }
}
