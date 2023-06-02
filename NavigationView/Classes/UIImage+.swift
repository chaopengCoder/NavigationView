//
//  UIImage+.swift
//  NavigationView
//
//  Created by Hal Yek on 1/6/2023.
//

import Foundation

extension UIImage {

    static func make(named name: String) -> UIImage? {
        let bundle = Bundle.podBundle
        let image = UIImage(named: name, in: bundle, compatibleWith: nil)
        return image
    }
}
