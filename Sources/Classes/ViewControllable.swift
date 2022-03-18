//
//  Copyright (c) 2017. Uber Technologies
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

/// Basic interface between a `Router` and the UIKit `UIViewController`.
public protocol ViewControllable: AnyObject {

    var uiviewController: UIViewController { get }
}

/// Default implementation on `UIViewController` to conform to `ViewControllable` protocol
public extension ViewControllable where Self: UIViewController {

    var uiviewController: UIViewController {
        return self
    }
}

public extension ViewControllable {
    
    func present(_ viewControllable: ViewControllable, presentationStyle: UIModalPresentationStyle = .fullScreen, animated: Bool, completion: (() -> Void)?) {
        viewControllable.uiviewController.modalPresentationStyle = presentationStyle
        self.uiviewController.present(viewControllable.uiviewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        guard !uiviewController.isBeingDismissed else { return }
        self.uiviewController.dismiss(animated: animated, completion: completion)
    }

    func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.pushViewController(viewControllable.uiviewController, animated: animated)
        } else {
            self.uiviewController.navigationController?.pushViewController(viewControllable.uiviewController, animated: animated)
        }
    }

    func popViewController(animated: Bool) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.popViewController(animated: animated)
        } else {
            self.uiviewController.navigationController?.popViewController(animated: animated)
        }
    }

    func popToRoot(animated: Bool) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.popToRootViewController(animated: animated)
        } else {
            self.uiviewController.navigationController?.popToRootViewController(animated: animated)
        }
    }

    func setViewControllers(_ viewControllerables: [ViewControllable]) {
        if let nav = self.uiviewController as? UINavigationController {
            nav.setViewControllers(viewControllerables.map(\.uiviewController), animated: true)
        } else {
            self.uiviewController.navigationController?.setViewControllers(viewControllerables.map(\.uiviewController), animated: true)
        }
    }
}
