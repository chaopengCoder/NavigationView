//
//  BViewController.swift
//  NavigationView_Example
//
//  Created by mac on 2022/4/26.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

class BViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        view.backgroundColor = .red
        title("BViewController")
        showBackButton()
        let rightTitleBtn = addRightBtn(title: "右侧按钮")
        rightTitleBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
    }
    
    // 导航条右侧按钮事件
    @objc fileprivate func rightBtnAction() {
        print("出发导航栏右侧按钮事件")
    }
    
    override func popViewController() {
        super.popViewController()
        print("返回上个页面")
    }
}
