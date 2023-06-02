//
//  NavigationViewConfig.swift
//  NavigationView
//
//  Created by CPCoder on 2022/4/26.
//

import Foundation

public class NavigationConfig {
    
    /// The name of back button image, Default: "nav_btn_close_pre"
    public var backImageName = "nav_btn_close_pre"
    /// The distance from the left button to the screen, Default: 8 pt
    public var leftSpacing: CGFloat = 8
    /// The distance from the right view to the screen, Default: 8 pt
    public var rightSpacing: CGFloat = 8
    /// Title color, Default: UIColor.black
    public var titleColor = UIColor.black
    /// Background color, Default: UIColor.clear
    public var backgaroundColor = UIColor.clear
    /// The height of each item on the right, Default: 30 pt
    public var rightViewItemsHeight: CGFloat = 30
    /// Spacing between items when there are multiple items on the right, Default: 10 pt
    public var rightViewItemsSpacing: CGFloat = 10
    /// Title font, Default: UIFont.systemFont(ofSize: 15, weight: .medium)
    public var titleFont = UIFont.systemFont(ofSize: 15, weight: .medium)
}
