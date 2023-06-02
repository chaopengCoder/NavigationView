//
//  Bundle+.swift
//  NavigationView
//
//  Created by Hal Yek on 1/6/2023.
//

import Foundation

extension Bundle {
    
    static var podBundle: Bundle? {
        let podBundle = Bundle(for: NavigationView.self)
        guard let u = podBundle.url(forResource: "NavigationView", withExtension: "bundle") else {
            return nil
        }
    
        return Bundle(url: u)
    }
}
