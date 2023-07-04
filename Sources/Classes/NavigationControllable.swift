//
//  NavigationControllable.swift
//  ShinhanRIBs
//
//  Created by a60105114 on 2022/04/20.
//

import UIKit

public protocol NavigationControllable {
    init(root: UIViewController)
    var navigationController: UINavigationController { get }
}

public extension NavigationControllable where Self: UINavigationController {
    var navigationController: UINavigationController {
        return self
    }
}
