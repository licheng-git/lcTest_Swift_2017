//
//  VC6.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/11.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC6: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "extension"
        
        // 扩展可用于class，struct等
        
        let add = 3.addition
        print(add)
        let sub = 3.subtract
        print(sub)
        let mul = 3.multiplication()
        print(mul)
        let div = 3.division()
        print(div)
        
        var squ = 3
        squ.square()
        print(squ)
        
        print(123[4])
    }

}


fileprivate extension Int {
    var addition: Int {
        get {
            return self + 100
        }
    }
    var subtract: Int {
        return self - 100
    }
    func multiplication() -> Int {
        return self * 10
    }
    func division() -> Float {
        return Float(self/2)
    }
    mutating func square() {  // mutating 修改self或其属性的方法需mutating修饰
        self = self * self
    }
    // subscript 扩展下标
    subscript(index:Int) -> Int {
        var no1 = 1
        var indexCopy = index
        while indexCopy > 0 {
            no1 *= 10
            indexCopy -= 1
        }
        return (self / no1) % 10
    }
}




