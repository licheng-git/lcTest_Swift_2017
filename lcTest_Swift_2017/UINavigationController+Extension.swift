//
//  UINavigationController+Extension.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    class func TD_swizzleSendAction() {
        let cls = UINavigationController.self
        let originalSelector = #selector(pushViewController(_:animated:))
        let swizzledSelector = #selector(TD_pushViewController)
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    func TD_pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        self.TD_pushViewController(viewController, animated: animated)
        if self.viewControllers.count == 1 {
            viewController.hidesBottomBarWhenPushed = false
        }
    }
    
}


//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    self.hidesBottomBarWhenPushed = true
//}
//override func viewWillDisappear(_ animated: Bool) {
//    super.viewWillDisappear(animated)
//    self.hidesBottomBarWhenPushed = false
//}
