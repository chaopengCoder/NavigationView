//
//  NavigationView.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

// MARK: - NavigationView

public class NavigationView: UIView {
    static let kTag = 20180617
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tag = NavigationView.kTag
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundImage(image: UIImage?) -> UIImageView {
        let tag = 201805
        if let iv = viewWithTag(tag) as? UIImageView {
            iv.image = image
        }
        
        let iBackgroundIv = UIImageView()
        iBackgroundIv.image = image
        iBackgroundIv.clipsToBounds = true
        iBackgroundIv.contentMode = .scaleAspectFill
        iBackgroundIv.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iBackgroundIv)
        let top = NSLayoutConstraint(item: iBackgroundIv,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: 1,
                                         constant: 0)
        
        let bottom = NSLayoutConstraint(item: iBackgroundIv,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: 0)
        
        let left = NSLayoutConstraint(item: iBackgroundIv,
                                        attribute: .left,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .left,
                                        multiplier: 1,
                                        constant: 0)
        
        let right = NSLayoutConstraint(item: iBackgroundIv,
                                        attribute: .right,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .right,
                                        multiplier: 1,
                                        constant: 0)
        addConstraints([top, bottom, left, right])
        sendSubviewToBack(iBackgroundIv)
        return iBackgroundIv
    }
    
    func setTitle(_ title: String,
                  color: UIColor = .black,
                  font: UIFont = .systemFont(ofSize: 18)) -> UILabel {
        let tag = 201806
        if let label = viewWithTag(tag) as? UILabel {
            label.font = font
            label.text = title
            label.textColor = color
        }
        
        let lb = UILabel()
        lb.tag = tag
        lb.font = font
        lb.text = title
        lb.textColor = color
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lb)
        
        let centerX = NSLayoutConstraint(item: lb,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: 0)
        
        let bottom = NSLayoutConstraint(item: lb,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -10)
        
        addConstraints([centerX, bottom])
        return lb
    }
    
    func setBackButton(image: UIImage?) -> UIButton {
        let tag = 201807
        if let btn = viewWithTag(tag) as? UIButton {
            btn.setImage(image, for: .normal)
            return btn
        }
        
        let btn = UIButton()
        btn.tag = tag
        btn.backgroundColor = .clear
        btn.setImage(image, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(btn)
        
        let leftSpacing = NavigationManager.shared.config.leftSpacing
        
        let left = NSLayoutConstraint(item: btn,
                                        attribute: .left,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .left,
                                        multiplier: 1,
                                        constant: leftSpacing)
        
        let bottom = NSLayoutConstraint(item: btn,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: 0)
        
        let top = NSLayoutConstraint(item: btn,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: self,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: StatusBarHeight)
        
        let width = NSLayoutConstraint(item: btn,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: btn,
                                        attribute: .height,
                                        multiplier: 1,
                                        constant: 0)
        
        addConstraints([left, bottom, width, top])
        return btn
    }
    
    func setRightView() -> UIStackView {
        let tag = 201808
        if let view = viewWithTag(tag) as? UIStackView {
            return view
        }
        
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = NavigationManager.shared.config.rightViewItemsSpacing
        addSubview(view)
        
        let rightSpacing = NavigationManager.shared.config.rightSpacing
        
        let right = NSLayoutConstraint(item: view,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .right,
                                       multiplier: 1,
                                       constant: -rightSpacing)
        
        
        let size = NavigationManager.shared.config.rightViewItemsHeight
        
        let height = NSLayoutConstraint(item: view,
                                        attribute: .height,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: size)
        
        let bottomSpacing = (NavigationBarHeight - size) / 2
        
        let bottom = NSLayoutConstraint(item: view,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: self,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: -bottomSpacing)
        
        addConstraints([bottom, height, right])
        return view
    }
}
