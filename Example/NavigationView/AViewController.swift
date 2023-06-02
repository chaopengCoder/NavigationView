//
//  AViewController.swift
//  NavigationView
//
//  Created by cpcoder on 04/26/2022.
//  Copyright (c) 2022 cpcoder. All rights reserved.
//

import UIKit
import SnapKit

/// StatusBar height
let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// NavigationView height = Status Bar's height + 44
let NavigationHeight: CGFloat = StatusBarHeight + 44

class AViewController: UIViewController {
    
    fileprivate lazy var iMainTb: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tb
    }()
    
    fileprivate var iNavigationView: NavigationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        // Set navigationbar hidden once
        navigationController?.isNavigationBarHidden = true
    }
    
    fileprivate func setupSubviews() {
        title("AViewController")
        iNavigationView = navigationView()
        view.addSubview(iMainTb)
        iMainTb.snp.makeConstraints { (make) in
            make.top.equalTo(NavigationHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

extension AViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")!
        cell.textLabel?.text = "Click to push BViewController"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension AViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(BViewController(), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        iNavigationView?.alpha = 1 - offsetY / 100.0
    }
}

