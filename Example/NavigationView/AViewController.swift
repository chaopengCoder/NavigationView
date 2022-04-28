//
//  AViewController.swift
//  NavigationView
//
//  Created by cpcoder on 04/26/2022.
//  Copyright (c) 2022 cpcoder. All rights reserved.
//

import UIKit

/// 状态栏高度
let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度: 状态栏高度 + 44
let NavigationHeight: CGFloat = StatusBarHeight + 44

class AViewController: UIViewController {
    
    fileprivate lazy var iMainTb: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tb
    }()
    
    fileprivate lazy var iHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    fileprivate var iNavigationView: NavigationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    fileprivate func setupSubviews() {
        title("AViewController")
        iNavigationView = navigationView()
        view.addSubview(iMainTb)
        iMainTb.snp.makeConstraints { (make) in
            make.top.equalTo(NavigationHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        iMainTb.tableHeaderView = iHeaderView
        iHeaderView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalToSuperview()
        }
    }
}

extension AViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension AViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(BViewController(), animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        iNavigationView?.alpha = 1 - offsetY / 100.0
    }
}

