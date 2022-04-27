//
//  NavigationController.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import UIKit
import Foundation

open class NavigationController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        isNavigationBarHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }

    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.visibleViewController?.navigationItem.backBarButtonItem = backItem
        
        // 设置tabbar主页界面点击跳转界面的时候隐藏底部tabbar
        if viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: animated)
        
        if viewControllers.count == 2 {
            viewController.hidesBottomBarWhenPushed = true
        }
    }

    override open func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        let viewController = viewControllers.last!
        viewController.hidesBottomBarWhenPushed = true
        super.setViewControllers(viewControllers, animated: animated)
    }
}

extension NavigationController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if viewControllers.count > 1 {
            return interactivePopGestureRecognizer?.isEnabled ?? true
        }
        return false
    }
}
