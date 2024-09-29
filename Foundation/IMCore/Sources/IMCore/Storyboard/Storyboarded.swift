//
//  Storyboarded.swift
//  IMCore
//
//  Created by DARRAN on 29/9/2567 BE.
//

import UIKit

public protocol Storyboardable where Self: UIViewController {
    static var storyboardName: String { get }
}

public extension Storyboardable {
    
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
    
    static var instantiateViewController: Self {
        let uiStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        
        guard let vc = uiStoryboard.instantiateViewController(withIdentifier: defaultReuseIdentifier) as? Self else {
            let error = "Could not instantiate view controller with identifier: \(defaultReuseIdentifier)"
            fatalError(error)
        }

        return vc
    }
}
