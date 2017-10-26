//
//  String+Extention.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/25.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import Compression

extension String {
    
    // 是否是纯数字的字符串
    func td_isNumberString() -> Bool {
        if characters.count == 0 {
            return false
        }
        let regex = "^[0-9]*$"
        //let r = self.range(of: regex, options: String.CompareOptions.regularExpression, range: nil, locale: nil)
        let r = range(of: regex, options: String.CompareOptions.regularExpression, range: nil, locale: nil)
        if r == nil {
            return false
        }
        return true
    }
    
//    // ?
//    private struct AssociatedKeys {
//        static var key_remark = "lc_remarkkk"
//    }
//    var p_ext_remark: Int? {
//        get {
//            return objc_getAssociatedObject(self, &AssociatedKeys.key_remark) as? Int
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &AssociatedKeys.key_remark, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    
}

extension UIViewController {
    private struct AssociatedKeys {
        static var key_remark = "lc_remark"
    }
    var p_ext_remark: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.key_remark) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.key_remark, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

