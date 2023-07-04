//
//  NavigateViewControllable.swift
//  ShinhanRIBs
//
//  Created by Jongho on 2022/06/27.
//

import UIKit
import Logger

public protocol NavigateViewControllable: ViewControllable {
    var navigationControllable: NavigationControllable? { get }
    
    func present(_ viewControllable: ViewControllable, presentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?)
    func presentNavigation(_ navigationControllable: NavigationControllable, presentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func pushViewController(_ viewControllable: ViewControllable, animated: Bool)
    func popViewController(animated: Bool)
    func popToRoot(animated: Bool)
    func setViewControllers(_ viewControllerables: [ViewControllable])
}

public extension NavigateViewControllable {
    var navigationControllable: NavigationControllable? {
        self.uiviewController.navigationController as? NavigationControllable
    }
    
    func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
        if let navigationController = navigationControllable?.navigationController {
            navigationController.pushViewController(viewControllable.uiviewController, animated: animated)
        } else {
            AppLogger.fault(tag: nil, message: "NavigationController Not Found")
        }
    }

    func popViewController(animated: Bool) {
        if let navigationController = navigationControllable?.navigationController {
            navigationController.popViewController(animated: animated)
        } else {
            AppLogger.fault(tag: nil, message: "NavigationController Not Found")
        }
    }

    func popToRoot(animated: Bool) {
        if let navigationController = navigationControllable?.navigationController {
            navigationController.popToRootViewController(animated: animated)
        } else {
            AppLogger.fault(tag: nil, message: "NavigationController Not Found")
        }
    }

    func setViewControllers(_ viewControllerables: [ViewControllable]) {
        if let navigationController = navigationControllable?.navigationController {
            navigationController.setViewControllers(viewControllerables.map(\.uiviewController), animated: true)
        } else {
            AppLogger.fault(tag: nil, message: "NavigationController Not Found")
        }
    }
}
