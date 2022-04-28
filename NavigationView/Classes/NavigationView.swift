//
//  NavigationView.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import SnapKit

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
    
    public func setTitle(_ title: String,
                         font: UIFont,
                         textColor color: UIColor = .black) -> UILabel {
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
    
    public func addRightBtn(image: UIImage? = nil, title: String? = nil) -> UIButton {
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
