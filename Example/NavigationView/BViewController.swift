//
//  BViewController.swift
//  NavigationView_Example
//
//  Created by mac on 2022/4/26.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation

class BViewController: UIViewController {
    
    fileprivate lazy var iSortBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.addTarget(self, action: #selector(sortAction), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var iCollectBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(collectionAction), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var iOtherBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        view.backgroundColor = .red
        title("BViewController")
        showBackButton()
        
        let naviRightview = showRightView()
        
        naviRightview.addArrangedSubview(iSortBtn)
        naviRightview.addArrangedSubview(iCollectBtn)
    }
    
    /// sort action
    @objc fileprivate func sortAction() {
        print("Sorted")
    }
    
    /// collection action
    @objc fileprivate func collectionAction() {
        print("Collected")
    }
    
    override func popViewController() {
        super.popViewController()
        print("Pop View Controller")
    }
}
