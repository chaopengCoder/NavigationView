//
//  UIViewController.swift
//  NavigationView
//
//  Created by mac on 2022/4/28.
//

import Foundation

extension UIViewController {
    
    /// Check the NavigationView, Create NavigationView if not exist
    ///
    /// - Returns: NavigationView
    @discardableResult
    public func navigationView() -> NavigationView {
        var view = self.view.viewWithTag(NavigationView.kTag) as? NavigationView
        if view == nil {
            view = addNavigationView()
        }
        return view!
    }
    
    /// Add NavigationBar to UIViewController instance
    ///
    /// - Returns: NavigationView
    @discardableResult
    func addNavigationView() -> NavigationView {
        let naviView = NavigationView()
        view.addSubview(naviView)
        naviView.backgroundColor = NavigationManager.shared.config.backgaroundColor
        let left = NSLayoutConstraint(item: naviView,
                                      attribute: .left,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .left,
                                      multiplier: 1,
                                      constant: 0)
        
        let right = NSLayoutConstraint(item: naviView,
                                      attribute: .right,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .right,
                                      multiplier: 1,
                                      constant: 0)
        
        let top = NSLayoutConstraint(item: naviView,
                                      attribute: .top,
                                      relatedBy: .equal,
                                      toItem: view,
                                      attribute: .top,
                                      multiplier: 1,
                                      constant: 0)
        
        let height = NSLayoutConstraint(item: naviView,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: NavigationHeight)
        
        view.addConstraints([right, left, top, height])
        return naviView
    }
    
    /// Set NavigationBar's title
    ///
    /// - Parameter title: title content
    /// - Returns: UILabel instance
    @discardableResult
    public func `title`(_ title: String) -> UILabel {
        let naviView = navigationView()
        let config = NavigationManager.shared.config
        return naviView.setTitle(title,
                                 color: config.titleColor,
                                 font: config.titleFont)
    }
    
    /// Set return button for NavigationBar
    /// - Parameter image: image instance for button,  default is 'btn_return'
    /// - Returns: UIButton instance
    @discardableResult
    public func showBackButton(image: UIImage? = nil) -> UIButton {
        let config = NavigationManager.shared.config
        
        var img = image
        if image == nil {
            img = UIImage(named: config.backImageName)
            if img == nil {
                img = UIImage.make(named: "nav_btn_close_pre")
            }
        }
        
        let naviView = navigationView()
        let button = naviView.setBackButton(image: img)
        button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        return button
    }
    
    @discardableResult
    public func showRightView() -> UIStackView {
        let naviView = navigationView()
        return naviView.setRightView()
    }
    
    /// Go back
    @objc open func popViewController() {
        let vc = navigationController?.popViewController(animated: true)
        if vc == nil {
            dismiss(animated: true, completion: nil)
        }
    }
}
