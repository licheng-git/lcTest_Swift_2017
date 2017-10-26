//
//  VC5.swift
//  lcTest_Swift
//
//  Created by licheng on 2017/9/8.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class VC5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ARC"
        self.test()
        self.test1()
    }
    
    deinit {
        print("VC5 deinit")
    }
    
    var pStr = "pStr"
    var pClosures : (()->())?

    
    // ? ! Optioinal Chaining  可选链
    func test() {
        
        class LcClassKK {
            var pStr : String = "ClassKK.pStr";
            var pStr1 : String?
            init?(_ param:String) {
                if (param.isEmpty) {
                    return nil
                }
            }
        }
        
        let objKK = LcClassKK("p")
        if (objKK == nil) {
            print("objKK == nil")
        }
        else {
            print("objKK!.pStr = \(objKK!.pStr)")
        }
        print("objKK?.pStr = \(objKK?.pStr)")
        
        if let objKK1 = LcClassKK("") {
            print("objKK1.pStr = \(objKK1.pStr)")
        }
        else {
            print("objKK1 == nil")
        }
        
        if let str = LcClassKK("")?.pStr {
            print("1 str = \(str)")
        }
        if let str = LcClassKK("p")?.pStr1?.characters {
            print("2 str = \(str)")
        }
        
    }
    
    
    // 循环引用
    func test1() {
        
        class Person {
            let name : String
            init(_ n:String) {
                self.name = n
            }
            deinit {
                print("*_* Person deinit")
            }
            var apartment: Apartment?
        }
        
        class Apartment {
            let number : Int
            init(_ n:Int) {
                self.number = n
            }
            deinit {
                print("*_* Apartment deinit")
            }
            //var person: Person?  // *_* 强引用 Person和Apartment存在内存泄漏，deinit不会执行
            weak var person: Person?  // 避免循环引用解决办法一：weak弱引用
        }
        
        var p:Person? = Person("licheng")
        var a:Apartment? = Apartment(1003)
        p?.apartment = a
        a?.person = p
        print(p?.apartment?.number)
        print(a?.person?.name)
        p = nil
        a = nil
        
//        class Apartment {
//            let number : Int
//            unowned let person : Person  // 避免循环引用解决办法二：unowned无主引用
//            init(_ n:Int, _ p:Person) {
//                self.number = n
//                self.person = p
//            }
//            deinit {
//                print("*_* Apartment deinit")
//            }
//        }
//        
//        var p:Person? = Person("licheng")
//        var a:Apartment? = Apartment(1003, p!)
//        p?.apartment = a
//        print(p?.apartment?.number)
//        print(a?.person.name)
//        p = nil
//        a = nil
        
        
//        // self中有闭包属性pClosures，闭包属性pClosures中有self
//        self.pClosures = {
//            print("<p>\(self.pStr)</p>")
//        }  // err VC5.deinit不执行
        self.pClosures = {
            [weak self] in
            print("<p>\(self!.pStr)</p>")
            //[unowned self] in
            //print("<p>\(self.pStr)</p>")
        }
        self.pClosures!()
    }
    
    
}


