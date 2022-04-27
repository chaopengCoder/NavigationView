//
//  NavigationView.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import SnapKit

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
        return naviView.addMenuBtn(image: image, title: title)
    }
    
    /// 返回上一页
    @objc open func popViewController() {
        let vc = navigationController?.popViewController(animated: true)
        if vc == nil {
            dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: - NavigationView

public class NavigationView: UIView {
    public static let TAG = 15241232
    public var leftViewTags = [15241234, 15241235, 15241236]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tag = NavigationView.TAG
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTitle(_ title: String, font: UIFont, textColor color: UIColor = .black) -> UILabel {
        let tag = 12313
        if let label = self.viewWithTag(tag) as? UILabel {
            label.text = title
            label.textColor = color
            return label
        }
        
        let lb = UILabel()
        addSubview(lb)
        lb.tag = tag
        lb.text = title
        lb.textColor = color
        lb.textAlignment = .center
        lb.font = font
        lb.snp.makeConstraints({ (make) in
            make.left.equalTo(120.px)
            make.right.equalTo(-120.px)
            make.bottom.equalToSuperview()
            make.top.equalTo(StatusBarHeight)
        })
        return lb
    }
    
    public func showBackButton(image: UIImage?) -> UIButton {
        let tag = leftViewTags[0]
        if let btn = self.viewWithTag(tag) as? UIButton {
            btn.setImage(image, for: .normal)
            return btn
        }
        let btn = UIButton()
        addSubview(btn)
        btn.tag = tag
        btn.backgroundColor = .clear
        btn.setImage(image, for: .normal)
        btn.snp.makeConstraints({ (make) in
            make.left.equalTo(20.px)
            make.bottom.equalToSuperview()
            make.top.equalTo(StatusBarHeight)
            make.width.equalTo(btn.snp.height)
        })
        return btn
    }
    
    public func addMenuBtn(image: UIImage? = nil, title: String? = nil) -> UIButton {
        let btn = UIButton()
        addSubview(btn)
        btn.backgroundColor = .clear
        btn.setImage(image, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 28.px, weight: .medium)
        btn.snp.makeConstraints({ (make) in
            make.right.equalTo(-26.px)
            if let _ = title {
                make.bottom.equalToSuperview()
                make.top.equalTo(StatusBarHeight)
            }
            if let _ = image {
                make.centerY.equalToSuperview().offset(StatusBarHeight / 2)
            }
        })
        return btn
    }
}
