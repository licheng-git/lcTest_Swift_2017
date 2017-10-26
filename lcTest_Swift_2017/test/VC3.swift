//
//  VC3.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/6.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC3: UIViewController {
    
    var pClosures : (()->())?
    var pClosures1 : (()->Void)?
    var pClosures2 : ((_ a:Int,_ b:Int)->Int)?
    var pClosures3 : ((Int,Int)->String)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "closures"
        
        // swift闭包类似oc里的block代码块
        
        
        let testClosures = { print("swift闭包实例") }
        testClosures();
        
        let testClosures_add = { (a:Int, b:Int) -> Int in
            print("{ (params) -> returnType in 。。。 }")
            return a + b
        }
        print(testClosures_add(1, 3))
        
        
        func testClosures1(c: ()->()) {
            for _ in 0...2 {
                c()
            }
        }
        testClosures1 {
            print("closures as param")
        }
        
        let arrStr = ["AT", "D", "AE", "S", "BE"]
        // 写法0
        let arrStr_reversed = arrStr.sorted { (s0:String, s1:String) -> Bool in
            return s0 > s1
        }
        // 写法1  闭包作为参数
        let backwardsC = { (s0:String, s1:String) -> Bool in
            return s0 > s1
        }
        let arrStr_reversed1 = arrStr.sorted(by: backwardsC)
        // 写法2  闭包函数作为参数
        func backwardsF(s0:String, s1:String) -> Bool {
            return s0 > s1
        }
        let arrStr_reversed2 = arrStr.sorted(by: backwardsF)
        // 写法3  简写
        let arrStr_reversed3 = arrStr.sorted(by: { $0 > $1 })
        // 写法4  简写
        let arrStr_reversed4 = arrStr.sorted(by: >)
        // 写法5 尾随闭包
        let arrStr_reversed5 = arrStr.sorted() { $0 > $1 }
        let arrStr_reversed5_1 = arrStr.sorted { $0 > $1 }
        let arrStr_reversed5_2 = arrStr.sorted() { (s0:String, s1:String) -> Bool in
            return s0 > s1
        }
        
        print(arrStr_reversed)
        
        
        func testClosures2(c: (Int, Int)->(Int)) -> String {
            print("func begin")
            let c = c(1, 2)
            print("closures return \(c)")
            print("func end")
            return "func return"
        }
        print("*_* a")
        let kk = testClosures2 { (x, y) -> Int in
            print("closures action")
            return x + y
        }
        print("*_* b \(kk)")
//        *_* a
//        func begin
//        closures action
//        closures return 3
//        func end
//        *_* b func return
    }

}
