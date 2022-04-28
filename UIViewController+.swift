//
//  UIViewController.swift
//  NavigationView
//
//  Created by mac on 2022/4/28.
//

import Foundation

extension UIViewController {
    
    /// 获取导航栏是否存在，不存在就添加导航栏
    ///
    /// - Returns: 导航栏
    @discardableResult
    public func navigationView() -> NavigationView {
        var view = self.view.viewWithTag(NavigationView.TAG) as? NavigationView
        if view == nil {
            view = addNavigationView()
        }
        return view!
    }
    
    /// 添加导航栏控件
    ///
    /// - Returns: 导航栏
    @discardableResult
    public func addNavigationView() -> NavigationView {
        let naviView = NavigationView()
        view.addSubview(naviView)
        naviView.backgroundColor = .white
        naviView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(0)
            make.height.equalTo(NavigationHeight)
        }
        return naviView
    }
    
    /// 设置导航栏标题
    ///
    /// - Parameter title: 标题
    /// - Returns: 导航栏
    @discardableResult
    public func `title`(_ title: String) -> UILabel {
        let naviView = navigationView()
        let config = NavigationManager.shared.config
        return naviView.setTitle(title, font: config.titleFont, textColor: config.titleColor)
    }
    
    /// 显示返回按钮
    ///
    /// - Returns: 按钮
    @discardableResult
    public func showBackButton(image: UIImage? = nil) -> UIButton {
        let config = NavigationManager.shared.config
        if image == nil {
            config.check()
        }
        let button = showLeftButton(image: image ?? UIImage(named: config.backImgName))
        button.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        return button
    }
    
    /// 显示左上角按钮
    ///
    /// - Parameter image: 按钮图片
    /// - Returns: 按钮
    @discardableResult
    public func showLeftButton(image: UIImage?) -> UIButton {
        let naviView = navigationView()
        let button = naviView.showBackButton(image: image)
        return button
    }
    
    @discardableResult
    public func addRightBtn(image: UIImage? = nil, title: String? = nil) -> UIButton {
        let naviView = navigationView()
        return naviView.addRightBtn(image: image, title: title)
    }
    
    /// 返回上一页
    @objc open func popViewController() {
        let vc = navigationController?.popViewController(animated: true)
        if vc == nil {
            dismiss(animated: true, completion: nil)
        }
    }
}
